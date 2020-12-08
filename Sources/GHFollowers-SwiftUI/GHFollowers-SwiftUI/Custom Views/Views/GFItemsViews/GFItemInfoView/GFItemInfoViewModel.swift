//
//  GFItemInfoViewModel.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 24/11/2020.
//

import SwiftUI

struct GFItemInfoViewModel {
    let symbol: Image
    let title: String
    let count: String
    
    init(itemInfoType: ItemInfoType, count: Int?) {
        switch itemInfoType {
        case .repos:
            symbol = SFSymbols.repos
            title = ItemInfoType.repos.rawValue
            
        case .gists:
            symbol = SFSymbols.gists
            title = ItemInfoType.gists.rawValue
            
        case .followers:
            symbol = SFSymbols.followers
            title = ItemInfoType.followers.rawValue
            
        case .following:
            symbol = SFSymbols.following
            title = ItemInfoType.following.rawValue
        }
        
        self.count = "\(count ?? 0)"
    }
}
