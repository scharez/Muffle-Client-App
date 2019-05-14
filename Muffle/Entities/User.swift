//
//  User.swift
//  Muffle
//
//  Created by Stefan Scharinger on 02.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class User {
    var username, password: String;
    var role: Role;
    
    convenience init() {
        self.init(username: "", password: "", role: Role.MUFFLER);
    }
    
    init(username: String, password: String, role: Role) {
        self.username = username;
        self.password = password;
        self.role = role;
    }
    
    
    
}
