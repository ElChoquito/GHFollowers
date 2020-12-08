//
//  UIView+Extension.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 20/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    func addSubview(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
