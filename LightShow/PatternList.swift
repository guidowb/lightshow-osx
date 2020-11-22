//
//  PatternList.swift
//  LightShow
//
//  Created by Guido Westenberg on 11/9/20.
//

import SwiftUI

struct PatternList: View {
    let appDelegate = NSApplication.shared.delegate as! AppDelegate

    var body: some View {
        List {
            ForEach(appDelegate.patterns) { pattern in
                PatternRow(pattern: pattern)
            }
        }
    }
}

struct PatternList_Previews: PreviewProvider {
    static var previews: some View {
        PatternList()
    }
}
