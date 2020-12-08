//
//  FavoriteCell.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct FavoriteCell: View {
    let viewModel: FollowerCellViewModel
    
    init(_ follower: Follower) {
        viewModel = FollowerCellViewModel(follower: follower)
    }
    
    var body: some View {
        HStack {
            GFAvatarImageView(url: viewModel.follower.avatarUrl)
                .frame(width: 60,
                       height: 60)
                .accessibility(hidden: true)
            
            GFLargeTitleLabel(viewModel.follower.login)
                .lineLimit(1)
            
            Spacer()
        }
        .padding()
        .accessibilityHint(FollowerCellViewModel.followerCellAccessibilityHint)
    }
}


struct FavoriteCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCell(.sampleFollower)
    }
}

