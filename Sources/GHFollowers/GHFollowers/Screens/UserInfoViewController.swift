//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

protocol UserInfoViewControllerDelegate: class {
    func didRequestFollowers(for username: String)
}

class UserInfoViewController: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let headerView = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel = GFBodyLabel(textAlignment: .center)
    var itemView: [UIView] = []
    var doneButton: UIBarButtonItem!
    
    var username: String!
    weak var delegate: UserInfoViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureScrollView()
        layoutUI()
        getUserInfo()
    }
    
    private func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success( let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentGFAlertOnMainThread(message: error.rawValue)
            }
        }
    }
    
    private func add(_ childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.didMove(toParent: self)
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}
//MARK: UI
private extension UserInfoViewController {
    func configureViewController() {
        view.backgroundColor = .systemBackground
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.pinToEdges(of: view)
        contentView.pinToEdges(of: scrollView)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 600)
        ])
    }
    
    func configureUIElements(with user: User) {
        let repoItemViewController = GFRepoItemViewController(user: user, delegate: self)
        
        let followerItemViewController = GFFollowerItemViewController(user: user, delegate: self)
        
        self.add(repoItemViewController, to: self.itemViewOne)
        self.add(followerItemViewController, to: self.itemViewTwo)
        self.add(GFUserInfoHeaderViewController(user: user), to: self.headerView)
        
        self.dateLabel.text = String(format: NSLocalizedString("userInfoViewController.dateLabel.text"), user.createdAt.convertToMonthYearFormat())
        
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        itemView = [headerView, itemViewOne, itemViewTwo,dateLabel]
        
        for itemView in itemView{
            contentView.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
//MARK: Delegates
extension UserInfoViewController: GFRepoItemViewControllerDelegate {
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL",
                                       message: "URL attached to this user is invalid.")
            return
        }
        
        presentSafariViewController(with: url)
    }
}

extension UserInfoViewController: GFFollowerItemViewControllerDelegate {
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "userInfoViewController.noFollowers.alert.title",
                                       message: "userInfoViewController.noFollowers.alert.message",
                                       buttonTitle: "userInfoViewController.noFollowers.alert.button")
            return
        }
        
        delegate.didRequestFollowers(for: user.login)
        dismissViewController()
    }
}
