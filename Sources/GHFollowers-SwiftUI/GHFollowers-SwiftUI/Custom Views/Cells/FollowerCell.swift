//
//  FollowerCell.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct FollowerCell: View {
    let viewModel: FollowerCellViewModel
    
    init(_ follower: Follower) {
        viewModel = FollowerCellViewModel(follower: follower)
    }
    
    var body: some View {
        VStack {
            GFAvatarImageView(url: viewModel.follower.avatarUrl)
                .accessibility(hidden: true)
            
            GFTitleLabel(viewModel.follower.login)
                .lineLimit(1)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(String(format: FollowerCellViewModel.followerCellAccessibilityLabel,viewModel.follower.login)))
        .accessibilityHint(FollowerCellViewModel.followerCellAccessibilityHint)
    }
}

struct FollowerCell_Previews: PreviewProvider {
    static var previews: some View {
        FollowerCell(.sampleFollower)
    }
}
