//
//  FavoritesListViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 02/12/2020.
//

import SwiftUI

final class FavoritesListViewModel: ObservableObject {
    @Published var alertItem: AlertItem?
    
    static let titleKey: LocalizedStringKey = "favoritesListView.title"
    static let emptyStateMessage = "favoritesListView.emptyStateView.message"
    
    func retrieveFavorites(persistanceManager: PersistenceManager) {
        if let _ = persistanceManager.retrieveFavorites() {
            alertItem = AlertContext.unableToFavorite
        }
    }
    
    func remove(indexSet: IndexSet, persistanceManager: PersistenceManager) {
        if let _ = persistanceManager.remove(indexSet: indexSet) {
            alertItem = AlertContext.unableToFavorite
        }
    }
}
