//
//  GFFollowerItemViewController.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

protocol GFFollowerItemViewControllerDelegate: class {
    func didTapGetFollowers(for user: User)
}

class GFFollowerItemViewController: GFItemInfoViewController {
    weak var delegate: GFFollowerItemViewControllerDelegate!
    
    init(user: User, delegate: GFFollowerItemViewControllerDelegate) {
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
        delegate.didTapGetFollowers(for: user)
    }
}
//MARK: UI
private extension GFFollowerItemViewController {
    func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "gfFollowerItemViewController.actionButton.title")
    }
}
//MARK: Accessibility
private extension GFFollowerItemViewController {
    func applyAccessibility() {
        actionButton.accessibilityHint = String.localizedStringWithFormat(NSLocalizedString("gfFollowerItemViewController.actionButton.accessibilityHint"),user.login)
    }
}
