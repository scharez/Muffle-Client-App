//
//  User.swift
//  Muffle
//
//  Created by Stefan Scharinger on 02.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class User {
    let username, password: String;
    
    init(username: String, password: String) {
        self.username = username;
        self.password = password;
    }
}
