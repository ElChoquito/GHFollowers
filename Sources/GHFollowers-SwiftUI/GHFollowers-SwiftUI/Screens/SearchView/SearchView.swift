//
//  SearchView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Images.ghLogo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200,
                           height: 200)
                    .padding(.bottom)
                
                GFTextFields(titleKey: SearchViewModel.textFieldTitleKey,
                             text: $viewModel.username)
                    .accessibilityLabel(SearchViewModel.textFieldAccessibilityLabel)
                
                Spacer()
                
                NavigationLink(destination: FollowerListView(username: $viewModel.username)) {
                    GFButton(title: SearchViewModel.buttonTitleKey,
                             backgroundColor: .green)
                        .accessibilityLabel(SearchViewModel.buttonAccessibilityHint)
                }
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
