//
//  GFUserInfoViewController.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class GFUserInfoHeaderViewController: UIViewController {
    
    private let avatarImageView = GFAvatarImageView(frame: .zero)
    private let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    private let nameLabel = GFSecondaryTitleLabel()//GFSecondaryTitleLabel(fontSize: 18)
    private let locationImageView = UIImageView()
    private let locationLabel = GFSecondaryTitleLabel()//GFSecondaryTitleLabel(fontSize: 18)
    private let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil,
                   bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(avatarImageView, usernameLabel, nameLabel, locationImageView, locationLabel, bioLabel)
        layoutUI()
        configureUIElements()
        applyAccessibility()
    }
}
//MARK: UI
private extension GFUserInfoHeaderViewController {
    func configureUIElements() {
        avatarImageView.downloadAvatarImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? NSLocalizedString("gfUserInfoHeaderViewController.locationLabel.defaultText")
        bioLabel.text = user.bio ?? ""
        bioLabel.numberOfLines = 3
        locationImageView.image = SFSymbols.location
        locationImageView.tintColor = .secondaryLabel
    }
    
    func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor,
                                               constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor,
                                               constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant:20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}
//MARK: Accessibility
private extension GFUserInfoHeaderViewController {
    func applyAccessibility() {
        avatarImageView.isAccessibilityElement = true
        avatarImageView.accessibilityLabel = NSLocalizedString("gfUserInfoHeaderViewController.avatarImageView.accessibilityLabel")
        
        usernameLabel.accessibilityLabel = NSLocalizedString("gfUserInfoHeaderViewController.usernameLabel.accessibilityLabel")
        usernameLabel.accessibilityValue = user.login
        
        nameLabel.accessibilityLabel = NSLocalizedString("gfUserInfoHeaderViewController.nameLabel.accessibilityLabel")
        nameLabel.accessibilityValue = user.name
        
        locationLabel.accessibilityLabel = NSLocalizedString("gfUserInfoHeaderViewController.locationLabel.accessibilityLabel")
        locationLabel.accessibilityValue = user.location
        
        bioLabel.accessibilityLabel = NSLocalizedString("gfUserInfoHeaderViewController.bioLabel.accessibilityLabel")
        bioLabel.accessibilityValue = user.bio
    }
}
