//
//  GFFollowerItemView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct GFFollowerItemView: View {
    @StateObject private var viewModel = GFItemViewModel()
    
    @Binding var user: User
    var body: some View {
        VStack {
            HStack {
                GFItemInfoView(itemInfoType: .followers,
                               count: viewModel.user.followers)
                
                Spacer()
                
                GFItemInfoView(itemInfoType:.following,
                               count: viewModel.user.following)
            }
            
            if viewModel.user.followers > 0 {
                Button {
                    NotificationCenter.default.post(name: NSNotification.Name(GFNotificationName.username.rawValue),
                                                    object: viewModel.user.login)
                } label: {
                    GFButton(title: GFItemViewModel.followerButtonTitle,
                             backgroundColor: .green)
                }
                .accessibilityHint(Text(String(format: GFItemViewModel.followerButtonAccessibilityHint,
                                               viewModel.user.login)))
            }
        }
        .onChange(of: user) { user in
            viewModel.user = user
        }
        .onAppear {
            viewModel.user = user
        }
    }
}

struct GFFollowerItemView_Previews: PreviewProvider {
    static var previews: some View {
        GFFollowerItemView(user: .constant(User.sampleUser))
    }
}

