//
//  GHFollowers_SwiftUIApp.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

@main
struct GHFollowers_SwiftUIApp: App {
    @StateObject var persistenceManager = PersistenceManager()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                SearchView()
                    .tabItem {
                        SFSymbols.search
                        Text("searchView.title")
                    }
                
                FavoritesListView()
                    .tabItem {
                        SFSymbols.favorites
                        Text("favoritesListView.title")
                    }
            }
            .environmentObject(persistenceManager)
            .accentColor(.green)
        }
    }
}
