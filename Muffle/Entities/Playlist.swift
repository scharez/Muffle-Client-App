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
    
    var songs : [Song];
    
    convenience init() {
        self.init(id: 1, name: "", songs: []);
    }
    
    init(id: Int, name: String, songs : [Song]) {
        self.id = id;
        self.name = name;
        self.songs = songs;
    }
}
