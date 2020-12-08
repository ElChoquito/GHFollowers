//
//  Follower.swift
//  GHFollowers
//
//  Created by Sylvain Guillier on 18/11/2020.
//  Copyright © 2020 Sylvain Guillier. All rights reserved.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}
