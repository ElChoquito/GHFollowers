//
//  GFUserInfoHeaderViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 24/11/2020.
//

import SwiftUI

final class GFUserInfoHeaderViewModel: ObservableObject {
    @Published var user: User = .placeholder
    
    var location: String {
        user.location ?? NSLocalizedString("gfUserInfoHeaderView.locationLabel.defaultText")
    }
}

//MARK: Accessibility
extension GFUserInfoHeaderViewModel {
    static let avatarAccessibilityLabel: LocalizedStringKey = "gfUserInfoHeaderView.avatarImageView.accessibilityLabel"
    static let loginAccessibilityLabel: LocalizedStringKey = "gfUserInfoHeaderView.usernameLabel.accessibilityLabel"
    static let nameAccessibilityLabel: LocalizedStringKey = "gfUserInfoHeaderView.nameLabel.accessibilityLabel"
    static let locationAccessibilityLabel: LocalizedStringKey = "gfUserInfoHeaderView.locationLabel.accessibilityLabel"
    static let bioAccessibilityLabel: LocalizedStringKey = "gfUserInfoHeaderView.bioLabel.accessibilityLabel"
    
}
