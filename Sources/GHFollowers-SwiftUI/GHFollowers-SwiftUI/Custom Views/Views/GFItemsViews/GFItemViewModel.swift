//
//  GFItemViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 01/12/2020.
//

import Foundation
import SwiftUI

final class GFItemViewModel: ObservableObject {
    @Published var user: User = .placeholder
    
    static let repoButtonTitle: LocalizedStringKey = "gfRepoItemView.actionButton.title"
    static let followerButtonTitle: LocalizedStringKey = "searchView.calToActionButton.title"
}

//MARK: Accessibility
extension GFItemViewModel {
    static let followerButtonAccessibilityHint: String = NSLocalizedString("gfFollowerItemView.actionButton.accessibilityHint")
    
    static let repoButtonAccessibilityHint: String = NSLocalizedString("gfRepoItemView.actionButton.accessibilityHint")
}
