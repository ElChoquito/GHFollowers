//
//  GFTitleLabel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct GFTitleLabel: View {
    let key: LocalizedStringKey

    init(_ text: String?) {
        guard  let text = text else {
            self.key = LocalizedStringKey("")
            return
        }
        
        self.key = LocalizedStringKey(text)
    }
    
    var body: some View {
        Text(key)
            .font(.headline)
            .minimumScaleFactor(0.75)
    }
}

struct GFTitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        GFTitleLabel("GFTitleLabel")
    }
}
