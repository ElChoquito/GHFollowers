//
//  GFError.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import Foundation

enum GFError: String, Error{
    case invalidUsername = "gfError.invalidUsername.message"
    case unableToComplete = "gfError.unableToComplete.message"
    case invalidResponse = "gfError.invalidResponse.message"
    case invalidData = "gfError.invalidData.message"
    case unableToFavorite = "gfError.unableToFavorite.message"
    case alreadyInFavorites = "gfError.alreadyInFavorites.message"
}
