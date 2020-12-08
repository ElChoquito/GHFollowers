//
//  Alert.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 02/12/2020.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Text
    
    init(title: LocalizedStringKey? = nil, message: LocalizedStringKey, dismissButton: LocalizedStringKey? = nil) {
        self.title = Text(title ?? "gfAlertView.titleLabel.defaultText")
        self.message = Text(message)
        self.dismissButton = Text(dismissButton ?? "gfAlertView.dismissButton.defaultText" )
    }
}

struct AlertContext {
    static let invalidUsername = AlertItem(message: "gfError.invalidUsername.message")
    
    static let unableToComplete = AlertItem(message: "gfError.unableToComplete.message")
    
    static let invalidResponse = AlertItem(message: "gfError.invalidResponse.message")
    
    static let invalidData = AlertItem(message: "gfError.invalidData.message")
    
    static let unableToFavorite = AlertItem(message: "gfError.unableToFavorite.message")
    
    static let alreadyInFavorites = AlertItem(message: "gfError.alreadyInFavorites.message")
    
}

