//
//  Pattern.swift
//  LightShow
//
//  Created by Guido Westenberg on 11/15/20.
//

import Foundation

// IRL, the LED controller will implement a Canvas that writes to the LED color
// array, and pass that Canvas to the renderer. For the purpose of this integration,
// We're letting the CPP code manage the Canvas (over a static array), and it will
// give us access to it via a couple of static methods.

class Pattern : Identifiable {
    var id: String!
    var pattern: String!
    var nframes: Int!
    var framerate: Int!
    
    init(name: String, pattern: String, nframes: Int = 1, framerate: Int = 30) {
        self.id = name
        self.pattern = pattern
        self.nframes = nframes
        self.framerate = framerate
    }
}
