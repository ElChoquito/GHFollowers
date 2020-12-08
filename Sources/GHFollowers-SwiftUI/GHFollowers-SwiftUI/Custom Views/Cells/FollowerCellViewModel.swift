//
//  FollowerCellViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 24/11/2020.
//

import SwiftUI

struct FollowerCellViewModel {
    let follower: Follower
}

extension FollowerCellViewModel {
    static let followerCellAccessibilityLabel: String = NSLocalizedString("followerCell.accessibilityLabel")
    static let followerCellAccessibilityHint: LocalizedStringKey = "followerCell.accessibilityHint"
    static let favoriteCellAccessibilityHint: String = NSLocalizedString("favoriteCell.accessibilityHint")
}
