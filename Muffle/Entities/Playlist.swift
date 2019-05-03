//
//  Playlist.swift
//  Muffle
//
//  Created by Stefan Scharinger on 02.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class Playlist {
    let id: Int;
    let name: String;
    
    convenience init() {
        self.init(id: 1, name: "");
    }
    
    init(id: Int, name: String) {
        self.id = id;
        self.name = name;
    }
}
