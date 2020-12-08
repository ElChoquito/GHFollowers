//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import SwiftUI

final class PersistenceManager: ObservableObject {
    @AppStorage("userFavorites") private var userData: Data?
    @Published private(set) var favorites: [Follower] = []
    
    func add(favorite: Follower) -> GFError? {
        guard !favorites.contains(favorite) else { return .alreadyInFavorites }
        
        favorites.append(favorite)
        return self.save(favorites: favorites)
    }
    
    
    func remove(indexSet: IndexSet) -> GFError? {
        favorites.remove(atOffsets: indexSet)
        return self.save(favorites: favorites)
    }
    
    func retrieveFavorites() -> GFError? {
        guard let favoritesData = userData else {
            favorites = []
            return nil
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            self.favorites = favorites
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
    func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            userData = encodedFavorites
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
