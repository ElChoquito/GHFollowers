//
//  GFLargeTitleLabel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 24/11/2020.
//

import SwiftUI

struct GFLargeTitleLabel: View {
    let key: LocalizedStringKey

    init(_ text: String) {
        self.key = LocalizedStringKey(text)
    }

    var body: some View {
        Text(key)
            .font(.largeTitle)
            .bold()
            .minimumScaleFactor(0.75)
    }
}

struct GFLargeTitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        GFLargeTitleLabel("GFLargeTitle")
    }
}
