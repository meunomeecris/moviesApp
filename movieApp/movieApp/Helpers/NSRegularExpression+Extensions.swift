//
//  NSRegularExpression+Extensions.swift
//  movieApp
//
//  Created by Cris Messias on 14/04/22.
//

import Foundation

extension NSRegularExpression {
    func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }
}
