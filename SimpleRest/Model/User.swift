//
//  User.swift
//  SimpleRest
//
//  Created by Kentaro Mihara on 2023/08/02.
//

import Foundation


struct User: Codable{
    let user_id: String
    let name: String
    let group: String
}

struct UserRepositories: Codable{
    let users: [User]
}
