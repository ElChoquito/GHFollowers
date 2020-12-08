//
//  UserInfoView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct UserInfoView: View {
    @StateObject private var viewModel = UserInfoViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var username: String
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(spacing: 32) {
                    GFUserInfoHeaderView(user: $viewModel.user)
                    
                    Group {
                        GFRepoItemView(user: $viewModel.user)
                        
                        GFFollowerItemView(user: $viewModel.user)
                    }
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                    if let creationDate = viewModel.user.createdAt {
                        Text("userInfoView.dateLabel.text \(creationDate, formatter: DateFormatter.monthYearDateFormatter)")
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .onChange(of: username) { username in
                viewModel.getUserInfo(for: username)
            }
            .onAppear {
                viewModel.getUserInfo(for: username)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: doneButton)
        }
    }
}

private extension UserInfoView {
    var doneButton: some View {
        Button { self.presentationMode.wrappedValue.dismiss() }
            label: {
                Text(UserInfoViewModel.doneButtonKey)
                    .bold()
                    .foregroundColor(.green)
            }
    }
}


struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView(username: .constant(User.sampleUser.login))
    }
}

