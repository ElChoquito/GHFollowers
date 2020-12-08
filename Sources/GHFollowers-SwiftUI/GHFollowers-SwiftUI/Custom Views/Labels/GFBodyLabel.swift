//
//  GFBodyLabel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct GFBodyLabel: View {
    let key: LocalizedStringKey
    
    init(_ text: String?) {
        guard let text = text else {
            self.key = LocalizedStringKey("")
            return
        }
        
        self.key = LocalizedStringKey(text)
    }
    
    var body: some View {
        Text(key)
            .minimumScaleFactor(0.9)
    }
}

struct GFBodyLabel_Previews: PreviewProvider {
    static var previews: some View {
        GFBodyLabel("Body")
    }
}
