//
//  User.swift
//  Muffle
//
//  Created by Stefan Scharinger on 02.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class User {
    let username, password, firstName, lastName: String;
    
    convenience init() {
        self.init(username: "", password: "", firstName: "", lastName: "");
    }
    
    init(username: String, password: String, firstName: String, lastName: String) {
        self.username = username;
        self.password = password;
        self.firstName = firstName;
        self.lastName = lastName;
    }
    
    
    
}
