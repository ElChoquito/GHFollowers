//
//  GFItemInfoView.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

enum ItemInfoType: String {
    case repos = "gfItemInfoView.titleLabel.repos.text"
    case gists = "gfItemInfoView.titleLabel.gists.text"
    case followers = "gfItemInfoView.titleLabel.followers.text"
    case following = "gfItemInfoView.titleLabel.following.text"
}

class GFItemInfoView: UIView {
    let symbolImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left)
    let countLabel = GFTitleLabel(textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: UI
extension GFItemInfoView {
    private func configure() {
        addSubview(symbolImageView, titleLabel, countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = SFSymbols.repos
        case .gists:
            symbolImageView.image = SFSymbols.gists
        case .followers:
            symbolImageView.image = SFSymbols.followers
        case .following:
            symbolImageView.image = SFSymbols.following
        }
        titleLabel.text = NSLocalizedString(itemInfoType.rawValue)
        countLabel.text = String(count)
        
        applyAccessibility(itemInfoType: itemInfoType, withCount: count)
    }
}
//MARK: Accessibility
private extension GFItemInfoView {
    func applyAccessibility(itemInfoType: ItemInfoType, withCount count: Int) {
        isAccessibilityElement = true
        accessibilityLabel = NSLocalizedString(itemInfoType.rawValue)
        accessibilityValue = "\(count)"
    }
}
