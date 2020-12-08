//
//  Constants.swift
//  GHFollowers-SwiftUI
//
//  Created by Sylvain Guillier on 02/12/2020.
//

import SwiftUI

enum SFSymbols {
    static let search = Image(systemName: "magnifyingglass")
    static let favorites = Image(systemName: "star.fill")

    static let location = Image(systemName: "mappin.and.ellipse")
    static let repos = Image(systemName: "folder")
    static let gists = Image(systemName: "text.alignleft")
    static let followers = Image(systemName: "heart")
    static let following = Image(systemName: "person.2")
    
    static let add = Image(systemName: "plus")
}

enum Images {
    static let placeholder = Image("avatar-placeholder")
    static let emptyStateLogo = Image("empty-state-logo")
    static let ghLogo = Image(decorative: "gh-logo")
}

enum ItemInfoType: String {
    case repos = "gfItemInfoView.titleLabel.repos.text"
    case gists = "gfItemInfoView.titleLabel.gists.text"
    case followers = "gfItemInfoView.titleLabel.followers.text"
    case following = "gfItemInfoView.titleLabel.following.text"
}
