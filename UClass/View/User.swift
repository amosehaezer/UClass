//
//  User.swift
//  UClass
//
//  Created by Amos Ebenhaezer on 28/05/20.
//  Copyright © 2020 Amos Ebenhaezer. All rights reserved.
//

import Foundation

public struct User {
    
    var uid: String = ""
    var name: String = ""
    var email: String = ""
    var role: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case uid
        case name
        case email
        case role
    }
}
