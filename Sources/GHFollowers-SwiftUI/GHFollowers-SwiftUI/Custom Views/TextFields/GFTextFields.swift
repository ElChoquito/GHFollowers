//
//  GFTextFields.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct GFTextFields: View {
    let titleKey: LocalizedStringKey
    
    @Binding var text: String
    
    var body: some View {
        TextField(titleKey,
                  text: $text)
            .multilineTextAlignment(.center)
            .frame(height: 50)
            .font(.title2)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            .padding()
    }
}

struct GFTextFields_Previews: PreviewProvider {
    static var previews: some View {
        GFTextFields(titleKey: "",
                     text: .constant("GFTextFields"))
    }
}
