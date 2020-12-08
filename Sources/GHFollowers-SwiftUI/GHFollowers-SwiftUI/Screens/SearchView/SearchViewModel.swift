//
//  SearchViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 24/11/2020.
//

import SwiftUI

final class SearchViewModel: ObservableObject {
    @Published var username: String = ""
    
    static let textFieldTitleKey: LocalizedStringKey = "searchView.usernameTextField.text"
    static let buttonTitleKey: LocalizedStringKey = "searchView.calToActionButton.title"
}

//MARK: Accessibility
extension SearchViewModel {
    static let textFieldAccessibilityLabel: LocalizedStringKey = "searchView.usernameTextField.accessibilityLabel"
    static let buttonAccessibilityHint: LocalizedStringKey = "searchView.callToActionButton.accessibilityHint"
}
