//
//  GFEmptyStateView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 26/11/2020.
//

import SwiftUI

struct GFEmptyStateView: View {
    let message: String
    
    var body: some View {
        VStack {
            Spacer()
            GFLargeTitleLabel(message)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Images.emptyStateLogo
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 500,
                           height: 500)
                    .padding([.bottom,
                              .trailing],
                             -150)
            }
        }
        .padding()
    }
}

struct GFEmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        GFEmptyStateView(message: "Empty State View")
    }
}
