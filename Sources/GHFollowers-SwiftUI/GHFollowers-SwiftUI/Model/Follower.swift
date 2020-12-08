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

extension Follower {
    static let placeholder: Follower = {
        Follower(login: "",
                 avatarUrl: "")
        
    }()
    
    static let sampleFollower: Follower  = {
        Follower(login: User.sampleUser.login,
                 avatarUrl: User.sampleUser.avatarUrl)
    }()
}
