//
//  User.swift
//  Muffle
//
//  Created by Stefan Scharinger on 02.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class User {
    var username, password, firstName, lastName: String;
    var role: Role;
    
    convenience init() {
        self.init(username: "", password: "", firstName: "", lastName: "", role: Role.MUFFLER);
    }
    
    init(username: String, password: String, firstName: String, lastName: String, role: Role) {
        self.username = username;
        self.password = password;
        self.firstName = firstName;
        self.lastName = lastName;
        self.role = role;
    }
    
    
    
}
