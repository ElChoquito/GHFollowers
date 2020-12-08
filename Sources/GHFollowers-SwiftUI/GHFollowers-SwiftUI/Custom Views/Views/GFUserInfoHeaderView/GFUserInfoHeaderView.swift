//
//  GFUserInfoHeaderView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct GFUserInfoHeaderView: View {
    @StateObject private var viewModel = GFUserInfoHeaderViewModel()
    
    @Binding var user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                GFAvatarImageView(url: viewModel.user.avatarUrl)
                    .frame(width: 90,
                           height: 90)
                    .accessibilityLabel(GFUserInfoHeaderViewModel.avatarAccessibilityLabel)
                
                
                VStack(alignment: .leading) {
                    GFLargeTitleLabel(viewModel.user.login)
                        .lineLimit(1)
                        .accessibilityLabel(GFUserInfoHeaderViewModel.loginAccessibilityLabel)
                        .accessibilityValue(viewModel.user.login)
                    
                    GFBodyLabel(viewModel.user.name)
                        .foregroundColor(.gray)
                        .accessibilityLabel(GFUserInfoHeaderViewModel.nameAccessibilityLabel)
                        .accessibilityValue(viewModel.user.name ?? "")
                    
                    HStack {
                        SFSymbols.location
                            .accessibility(hidden: true)
                        GFBodyLabel(viewModel.location)
                            .foregroundColor(.gray)
                    }
                    .foregroundColor(.gray)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel(GFUserInfoHeaderViewModel.locationAccessibilityLabel)
                    .accessibilityValue(viewModel.location)
                }
                
                Spacer()
            }
            
            if let bio = viewModel.user.bio {
                GFBodyLabel(bio)
                    .lineLimit(4)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.gray)
                    .accessibilityLabel(GFUserInfoHeaderViewModel.bioAccessibilityLabel)
                    .accessibilityValue(viewModel.user.bio ?? "")
            }
        }
        .onChange(of: user) { user in
            viewModel.user = user
        }
        .onAppear {
            viewModel.user = user
        }
        .padding()
    }
}

struct GFUserInfoHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GFUserInfoHeaderView(user: .constant(.sampleUser))
    }
}

