//
//  PatternImage.swift
//  LightShow
//
//  Created by Guido Westenberg on 11/28/20.
//

import SwiftUI

struct PatternImage: View {
    var pattern: LightShow.Pattern

    var body: some View {
        let width = getSize()
        let height = (pattern.nframes > 1 ? pattern.nframes : 3)!
        let rowheight = pattern.nframes > 1 ? 1 : 3
        let size = NSSize(width: Int(width), height: height)
        let renderer = compile2(pattern.id.CString(), pattern.pattern.CString())
        let image = NSImage(size: size, flipped: true, drawingHandler: { rect in
            for row in 0 ..< pattern.nframes {
                let timestamp = row * (1000 / pattern.framerate)
                render(renderer, timestamp)
                for p in 0 ..< width {
                    let rgba = getPixel(p)
                    let r = CGFloat(rgba >> 24 & 0x0ff) / 255.0
                    let g = CGFloat(rgba >> 16 & 0x0ff) / 255.0
                    let b = CGFloat(rgba >>  8 & 0x0ff) / 255.0
                    let a = CGFloat(rgba       & 0x0ff) / 255.0
                    let color = NSColor(red: r, green: g, blue: b, alpha: a)
                    let pixel = NSRect(origin: NSPoint(x: Int(p), y: row), size: NSSize(width: 1, height: rowheight))
                    color.setFill()
                    pixel.fill()
                }
            }
            return true
        })
        return Image(nsImage: image)
    }
}

struct PatternImage_Previews: PreviewProvider {
    static var previews: some View {
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        let pattern = appDelegate.patterns[0]
        return PatternImage(pattern: pattern)
    }
}
