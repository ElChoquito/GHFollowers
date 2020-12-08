//
//  GFRepoItemView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct GFRepoItemView: View {
    @StateObject var viewModel =  GFItemViewModel()
    
    @Binding var user: User
    var body: some View {
        VStack {
            HStack {
                GFItemInfoView(itemInfoType: .repos,
                               count: viewModel.user.publicRepos)
                
                Spacer()
                
                GFItemInfoView(itemInfoType: .gists,
                               count: viewModel.user.publicGists)
            }
            Link(destination: URL(string: viewModel.user.htmlUrl)!) {
                GFButton(title: GFItemViewModel.repoButtonTitle,
                         backgroundColor: .purple)
            }                        .accessibilityHint(Text(String(format: GFItemViewModel.repoButtonAccessibilityHint,
                                                                    viewModel.user.login)))
        }
        .onAppear {
            viewModel.user = user
        }
        .onChange(of: user) { user in
            viewModel.user = user
        }
    }
}

struct GFRepoItemView_Previews: PreviewProvider {
    static var previews: some View {
        GFRepoItemView(user: .constant(User.sampleUser))
    }
}
