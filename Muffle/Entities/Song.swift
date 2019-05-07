//
//  Song.swift
//  Muffle
//
//  Created by Stefan Scharinger on 02.05.19.
//  Copyright © 2019 Stefan Scharinger. All rights reserved.
//

import Foundation

class Song {
    var url, title, artist: String;
    var duration: Double;
    
    convenience init() {
        self.init(url: "", title: "", artist: "", duration: 0.0);
    }
    
    
    init(url: String, title: String, artist: String, duration: Double) {
        self.url = url;
        self.title = title;
        self.artist = artist;
        self.duration = duration;
    }
}
