//
//  FavoritesListView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct FavoritesListView: View {
    @StateObject private var viewModel = FavoritesListViewModel()
    @EnvironmentObject var persistenceManager: PersistenceManager
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(persistenceManager.favorites,
                            id: \.self) { follower in
                        NavigationLink(destination: FollowerListView(username: .constant(follower.login))) {
                            FavoriteCell(follower)
                        }
                    }
                    .onDelete { indexSet in
                        viewModel.remove(indexSet: indexSet,
                                         persistanceManager: persistenceManager)
                    }
                }
                .navigationBarTitle(FavoritesListViewModel.titleKey)
            }
            .alert(item: $viewModel.alertItem) {
                Alert(title: $0.title,
                      message: $0.message,
                      dismissButton: .default($0.dismissButton))
            }
            .onAppear {
                viewModel.retrieveFavorites(persistanceManager: persistenceManager)
            }
            
            if persistenceManager.favorites.isEmpty {
                GFEmptyStateView(message: FavoritesListViewModel.emptyStateMessage)
                    .padding()
            }
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}

