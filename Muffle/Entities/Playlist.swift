//
//  Playlist.swift
//  Muffle
//
//  Created by Stefan Scharinger on 02.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class Playlist {
    var id: Int
    var name: String;
    
    convenience init() {
        self.init(id: 1, name: "");
    }
    
    init(id: Int, name: String) {
        self.id = id;
        self.name = name;
    }
}
