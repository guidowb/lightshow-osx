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
    var size: Int!
    var canvas: [UInt32]!
    
    init(name: String, size: Int) {
        self.id = name
        self.size = size
        self.canvas = [UInt32](repeating: 0, count: size)
    }
    
    func setPixel(index: Int, rgba: UInt32) {
        self.canvas[index] = rgba
    }
}
