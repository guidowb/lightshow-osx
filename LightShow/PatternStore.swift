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
                var pattern: Pattern?
                print(name + ": " + contents)
                if contents.starts(with: "animate") {
                    let parts = contents.split(separator: "\n", maxSplits: 1)
                    let words = parts[0].split(separator: " ")
                    let contents = parts[1]
                    if words.count != 3 {
                        print("Invalid animation command in \(name), ignored")
                        pattern = LightShow.Pattern(name: name, pattern: String(contents))
                    }
                    else {
                        let nframes = Int(words[1]) ?? 1
                        let framerate = Int(words[2]) ?? 30
                        pattern = LightShow.Pattern(name: name, pattern: String(contents), nframes: nframes, framerate: framerate)
                    }
                }
                else {
                    pattern = LightShow.Pattern(name: name, pattern: contents)
                }
                if let pattern = pattern { patterns.append(pattern) }
            } catch {
                print("Could not load pattern \(name)")
            }
        }
    }
}
