//
//  FollowerListView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct FollowerListView: View {
    @StateObject private var viewModel = FollowerListViewModel()
    @EnvironmentObject var persistenceManager: PersistenceManager
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var username: String
    
    private let threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: threeColumnGrid) {
                    ForEach(viewModel.followers,
                            id: \.self) { follower in
                        FollowerCell(follower)
                            .onTapGesture {
                                viewModel.selectedFollower = follower
                                viewModel.showUserInfo = true
                            }
                            .onAppear {
                                viewModel.loadContentIfNeeded(currentFollower: follower)
                            }
                    }
                    .padding(.horizontal)
                }
                .sheet(isPresented: $viewModel.showUserInfo) {
                    UserInfoView(username: $viewModel.selectedFollower.login)
                }
                .onChange(of: username) { username in
                    viewModel.username = username
                }
                .onReceive(viewModel.usernameNotification) { output in
                    guard let username = output.object as? String else { return }
                    viewModel.reset(for: username)
                }
                .onAppear {
                    viewModel.username = username
                }
            }
            .navigationBarTitle(viewModel.username)
            .navigationBarItems(trailing: doneButton)
            
            if viewModel.isLoadingMoreFollowers {
                ProgressView()
            }
        }
        .alert(item: $viewModel.alertItem) {
            Alert(title: $0.title,
                  message: $0.message,
                  dismissButton: .default($0.dismissButton))
        }
    }
}

private extension FollowerListView {
    var doneButton: some View {
        Button { viewModel.getUserInfoForUsername { follower in
            guard let follower = follower else { return }
            
            viewModel.add(favorite: follower,
                          persistenceManager: persistenceManager)
        }
        
        } label: {
            SFSymbols.add
                .imageScale(.large)
                .frame(width: 45,
                       height: 45)
                .foregroundColor(.green)
        }
        .accessibilityLabel(FollowerListViewModel.addButtonAccessibilityLabel)
        .accessibility(hint:(Text(String(format: FollowerListViewModel.addButtonAccessibilityHint, viewModel.username))))
    }
}


struct FollowerListView_Previews: PreviewProvider {
    static var previews: some View {
        FollowerListView(username: .constant(Follower.sampleFollower.login))
    }
}

