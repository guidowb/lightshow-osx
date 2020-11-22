//
//  PatternStore.swift
//  LightShow
//
//  Created by Guido Westenberg on 11/15/20.
//

import Foundation

class PatternStore {
    var patterns = [LightShow.Pattern]()
    
    func loadPatterns() {
        let paths = Bundle.main.paths(forResourcesOfType: "lsp", inDirectory: "Patterns")
        for path in paths {
            let basename = path.split(separator: "/").last!
            let name = String(basename.split(separator: ".").first!)
            do {
                let contents = try String(contentsOfFile: path)
                print(name + ": " + contents)
                render(contents.CString())
                let size = Int(getSize())
                let pattern = LightShow.Pattern(name: name, size: size)
                for p in 0..<size {
                    pattern.setPixel(index: p, rgba: getPixel(Int32(p)))
                }
                patterns.append(pattern)
            } catch {
                print("Could not load pattern")
            }
        }
    }
}
