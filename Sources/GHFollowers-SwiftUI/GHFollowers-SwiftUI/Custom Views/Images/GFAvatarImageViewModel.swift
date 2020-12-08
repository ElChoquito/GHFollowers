//
//  GFAvatarImageViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 08/12/2020.
//

import SwiftUI

final class GFAvatarImageViewModel: ObservableObject {
    @Published var image: Image = Images.placeholder
    
    func download(for url: String) {
        NetworkManager.shared.downloadImage(from: url) { image in
            if image != nil {
                DispatchQueue.main.async { self.image = Image(uiImage: image!) }
            }
        }
    }
}
