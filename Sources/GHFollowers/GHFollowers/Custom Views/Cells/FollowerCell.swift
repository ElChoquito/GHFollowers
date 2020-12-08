//
//  FollowerCell.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: UI
extension FollowerCell {
    private func configure() {
        addSubview(avatarImageView,
                   usernameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
            
        ])
        
    }
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadAvatarImage(from: follower.avatarUrl)
        applyAccessibility(for: follower)
    }
}
//MARK: Accessibility
private extension FollowerCell {
    func applyAccessibility(for follower: Follower) {
        isAccessibilityElement = true
        accessibilityHint = NSLocalizedString("followerCell.accessibilityHint")
        accessibilityLabel = String.localizedStringWithFormat(NSLocalizedString("followerCell.accessibilityLabel"), follower.login)
        accessibilityTraits = [.image, .button]
    }
}
