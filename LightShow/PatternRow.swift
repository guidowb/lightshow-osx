//
//  PatternRow.swift
//  LightShow
//
//  Created by Guido Westenberg on 11/9/20.
//

import SwiftUI
import AppKit

struct PatternRow: View {
    var pattern: LightShow.Pattern
    var body: some View {
        VStack(alignment:.leading) {
            Text(pattern.id)
            PatternImage(pattern: pattern)
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
