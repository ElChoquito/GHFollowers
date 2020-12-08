//
//  GFTitleLabel.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 18/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import UIKit

class GFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat? = nil) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = (fontSize != nil) ? UIFont.systemFont(ofSize: fontSize!, weight: .bold) : UIFont.preferredFont(forTextStyle: .headline)
    }
}

//MARK: UI
private extension GFTitleLabel {
    func configure() {
        textColor = .label
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}

