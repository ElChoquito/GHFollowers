//
//  GFItemInfoView.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 23/11/2020.
//

import SwiftUI

struct GFItemInfoView: View {
    let viewModel: GFItemInfoViewModel
    
    init(itemInfoType: ItemInfoType, count: Int?) {
        viewModel = GFItemInfoViewModel(itemInfoType: itemInfoType,
                                        count: count)
    }
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            viewModel.symbol
                .accessibility(hidden: true)
            
            VStack {
                GFTitleLabel(viewModel.title)
                    .lineLimit(1)
                
                GFTitleLabel(viewModel.count)
            }
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(LocalizedStringKey(viewModel.title)))
        .accessibilityValue(viewModel.count)
    }
}

struct GFItemInfoView_Previews: PreviewProvider {
    static var previews: some View {
        GFItemInfoView(itemInfoType: .followers,
                       count: User.sampleUser.followers)
    }
}

