//
//  PatternRow.swift
//  LightShow
//
//  Created by Guido Westenberg on 11/9/20.
//

import SwiftUI
import AppKit

struct PatternBar: View {
    var pattern: LightShow.Pattern

    var body: some View {
        let size = NSSize(width: pattern.size, height: 3)
        let image = NSImage(size: size, flipped: false, drawingHandler: { rect in
            for p in 0 ..< pattern.size {
                let rgba = pattern.canvas[p]
                let r = CGFloat(rgba >> 24 & 0x0ff) / 255.0
                let g = CGFloat(rgba >> 16 & 0x0ff) / 255.0
                let b = CGFloat(rgba >>  8 & 0x0ff) / 255.0
                let a = CGFloat(rgba       & 0x0ff) / 255.0
                let color = NSColor(red: r, green: g, blue: b, alpha: a)
                let pixel = NSRect(origin: NSPoint(x: p, y: 0), size: NSSize(width: 1, height: 3))
                color.setFill()
                pixel.fill()
            }
            return true
        })
        return Image(nsImage: image)
    }
}

struct PatternRow: View {
    var pattern: LightShow.Pattern
    var body: some View {
        VStack(alignment:.leading) {
            Text(pattern.id)
            PatternBar(pattern: pattern)
        }
    }
}

struct PatternRow_Previews: PreviewProvider {
    static var previews: some View {
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        let pattern = appDelegate.patterns[0]
        return PatternRow(pattern: pattern)
    }
}
