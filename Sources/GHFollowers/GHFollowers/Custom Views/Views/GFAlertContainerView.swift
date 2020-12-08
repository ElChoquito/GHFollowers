//
//  GFAlertContainerView.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 20/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class GFAlertContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: UI
private extension GFAlertContainerView {
    func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        translatesAutoresizingMaskIntoConstraints = false
    }
}
