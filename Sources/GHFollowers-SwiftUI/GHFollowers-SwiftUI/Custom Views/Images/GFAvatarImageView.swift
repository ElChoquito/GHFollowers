//
//  GFAvatarImageViewOLD.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 24/11/2020.
//

import SwiftUI

struct GFAvatarImageView: View {
    @StateObject private var viewModel = GFAvatarImageViewModel()
    
    var url: String

    var body: some View {
        viewModel.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
            .onAppear {
                viewModel.download(for: url)
            }
            .onChange(of: url) { url in
                viewModel.download(for: url)
            }
    }
}

struct GFAvatarImageView_Previews: PreviewProvider {
    static var previews: some View {
        GFAvatarImageView(url: "")
    }
}

