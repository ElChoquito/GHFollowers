//
//  UserInfoViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 24/11/2020.
//

import SwiftUI

final class UserInfoViewModel: ObservableObject {
    @Published var user: User = .placeholder
    @Published var alertItem: AlertItem?
    
    static let doneButtonKey: LocalizedStringKey = "userInfoView.doneButton.text"
    
    func getUserInfo(for username: String) {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success( let user):
                DispatchQueue.main.async { self.user = user }
                
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
