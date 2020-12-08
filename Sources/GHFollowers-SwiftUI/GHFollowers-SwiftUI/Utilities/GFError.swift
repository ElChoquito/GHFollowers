//
//  GFError.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 19/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import Foundation

enum GFError: String, Error{
    case invalidUsername
    case unableToComplete
    case invalidResponse
    case invalidData
    case unableToFavorite
    case alreadyInFavorites
}
