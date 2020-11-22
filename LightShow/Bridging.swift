//
//  Bridging.swift
//  LightShow
//
//  Created by Guido Westenberg on 11/16/20.
//

import Foundation

extension String {
    func CString() -> UnsafeMutablePointer<CChar> {
        return UnsafeMutablePointer<CChar>(mutating: NSString(string: self).utf8String!)
    }
}
