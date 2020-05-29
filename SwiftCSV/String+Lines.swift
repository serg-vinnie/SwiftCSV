//
//  String+Lines.swift
//  SwiftCSV
//
//  Created by Naoto Kaneko on 2/24/16.
//  Copyright © 2016 Naoto Kaneko. All rights reserved.
//

extension String {
    var firstLine: String {
        var index = startIndex
        while index < endIndex && self[index] != "\r\n" && self[index] != "\n" && self[index] != "\r" {
            index = self.index(index, offsetBy: 1)
        }
        
        return String(self[startIndex..<index])
    }
}

private extension String {
    subscript (i: Int) -> String {
        get {
            return self[i ..< i + 1]
        }
        set (value) {
            let range = index(startIndex, offsetBy: i) ..< index(startIndex, offsetBy: i+1)
            self.replaceSubrange(range, with : value)
        }
    }
    
    subscript (r: Range<Int>) -> String {
        get {
            let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                                upper: min(count, max(0, r.upperBound))))
            let start = index(startIndex, offsetBy: range.lowerBound)
            let end = index(start, offsetBy: range.upperBound - range.lowerBound)
            return String(self[start ..< end])
        }
        set (value) {
            let range = Range(uncheckedBounds: (lower: max(0, min(count, r.lowerBound)),
                                                upper: min(count, max(0, r.upperBound))))
            let start = index(startIndex, offsetBy: range.lowerBound)
            let end = index(start, offsetBy: range.upperBound - range.lowerBound)
            
            self.replaceSubrange(start ..< end, with : value)
        }
    }
}
