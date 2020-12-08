//
//  GFButton.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct GFButton: View {
    let title: LocalizedStringKey
    let backgroundColor: Color

    var body: some View {
        HStack {
            Spacer()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
            
            Spacer()
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

struct GFButton_Previews: PreviewProvider {
    static var previews: some View {
        GFButton(title: "GFButton",
                  backgroundColor: .green)
    }
}
