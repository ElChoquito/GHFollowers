//
//  GFRepoItemViewController.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

protocol GFRepoItemViewControllerDelegate: class {
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemViewController: GFItemInfoViewController {
    weak var delegate: GFRepoItemViewControllerDelegate!
    
    init(user: User, delegate: GFRepoItemViewControllerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        applyAccessibility()
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}

//MARK: UI
private extension GFRepoItemViewController {
    func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "gfRepoItemViewController.actionButton.title")
    }
}

//MARK: Accessibility
private extension GFRepoItemViewController {
    func applyAccessibility() {
        actionButton.accessibilityHint = String.localizedStringWithFormat(NSLocalizedString("gfRepoItemViewController.actionButton.accessibilityHint"),user.login)
    }
}
