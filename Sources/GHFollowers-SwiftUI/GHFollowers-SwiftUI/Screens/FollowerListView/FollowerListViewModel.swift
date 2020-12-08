//
//  FollowerListViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

final class FollowerListViewModel: ObservableObject {
    var username: String = "" {
        didSet {
            searchFollowers()
        }
    }
    @Published private(set) var followers = [Follower]()
    @Published var selectedFollower = Follower.placeholder
    
    @Published var showUserInfo = false
    @Published private(set) var isLoadingMoreFollowers = false
    private var hasMoreFollowers = true
    private var pages = 1
    
    let usernameNotification = NotificationCenter.default
        .publisher(for: NSNotification.Name(GFNotificationName.username.rawValue))
    
    @Published var alertItem: AlertItem?
    
    func searchFollowers() {
        isLoadingMoreFollowers = true
        NetworkManager.shared.getFollowers(username: username,
                                           page: pages) { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                
                switch result {
                case .success(let followers):
                    self.pages += 1
                    self.followers.append(contentsOf: followers)
                    self.isLoadingMoreFollowers = false
                    if followers.count < 100 { self.hasMoreFollowers = false }
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        
                    case .invalidUsername:
                        self.alertItem = AlertContext.invalidUsername
                    default:
                        break
                    }
                }
            }
        }
    }
    
    func getUserInfoForUsername(completion: @escaping (Follower?) -> ()) {
        NetworkManager.shared.getUserInfo(for: username) { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    completion(Follower(login: user.login,
                                        avatarUrl: user.avatarUrl))
                }
                
            case .failure(let error):
                switch error {
                case .invalidData:
                    self.alertItem = AlertContext.invalidData
                    
                case .invalidResponse:
                    self.alertItem = AlertContext.invalidResponse
                    
                case .unableToComplete:
                    self.alertItem = AlertContext.unableToComplete
                    
                case .invalidUsername:
                    self.alertItem = AlertContext.invalidUsername
                default:
                    break
                }
                completion(nil)
            }
        }
    }
    
    func loadContentIfNeeded(currentFollower follower: Follower) {
        if follower == followers.last &&
            !isLoadingMoreFollowers &&
            hasMoreFollowers {
            searchFollowers()
        }
    }
    
    func reset(for username:String) {
        showUserInfo = false
        followers = []
        pages = 1
        self.username = username
    }
    
    func add(favorite: Follower, persistenceManager: PersistenceManager) {
        if let _ = persistenceManager.add(favorite: favorite) {
            alertItem = AlertContext.alreadyInFavorites
        } else {
            alertItem = AlertItem(title: "followerListView.userAddedSuccess.alert.title",
                                  message: "followerListView.userAddedSuccess.alert.message",
                                  dismissButton: "followerListView.userAddedSuccess.alert.button")
        }
    }
}

//MARK: Accessibility
extension FollowerListViewModel {
    static let addButtonAccessibilityLabel: LocalizedStringKey = "followerListView.addButton.accessibilityLabel"
    static let addButtonAccessibilityHint: String = NSLocalizedString("followerListView.addButton.accessibilityHint")
}
