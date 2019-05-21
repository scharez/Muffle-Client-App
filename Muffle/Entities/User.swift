//
//  User.swift
//  Muffle
//
//  Created by Stefan Scharinger on 02.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class User {
    var username, password, email: String;
    
    var playlists : [Playlist] = []
    
    convenience init() {
        self.init(username: "", password: "", email: "", playlists: []);
    }
    
    init(username: String, password: String, email: String, playlists: [Playlist]) {
        self.username = username;
        self.password = password;
        self.email = email;
        self.playlists = playlists;
    }
    
    
    
}
