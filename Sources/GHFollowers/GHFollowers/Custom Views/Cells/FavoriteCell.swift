//
//  FavoriteCell.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 20/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
    static let reuseID = "FavoriteCell"
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 26)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: UI
extension FavoriteCell {
    private func configure(){
        addSubview(avatarImageView,
                   usernameLabel)
        accessoryType = .disclosureIndicator
        
        let padding: CGFloat = 12
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func set(favorite: Follower){
        usernameLabel.text = favorite.login
        avatarImageView.downloadAvatarImage(from: favorite.avatarUrl)
        applyAccessibility(favorite: favorite)
    }
}
//MARK: Accessibility
private extension FavoriteCell {
    func applyAccessibility(favorite: Follower) {
        accessibilityHint = String.localizedStringWithFormat(NSLocalizedString("favoriteCell.accessibilityHint"), favorite.login)
    }
}
