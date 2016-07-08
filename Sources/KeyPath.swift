//
//  KeyPath.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-09.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

public struct KeyPath: StringLiteralConvertible, ArrayLiteralConvertible {
    var keys: [String]
    
    public init(_ keys: [String]) {
        self.keys = keys
    }
    
    public init(_ key: String) {
        self.keys = [key]
    }
    
    public init(stringLiteral value: String) {
        self.keys = [value]
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.keys = [value]
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.keys = [value]
    }
    
    public init(arrayLiteral elements: String...) {
        self.keys = elements
    }
}
