//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func downloadAvatarImage(from urlString: String) {
        NetworkManager.shared.downloadImage(from: urlString) { [weak self] (image) in
            guard let self = self else { return }
            
            DispatchQueue.main.async { self.image = image }
        }
    }
}
//MARK: UI
private extension GFAvatarImageView {
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
