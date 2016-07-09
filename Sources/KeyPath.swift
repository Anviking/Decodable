//
//  KeyPath.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-09.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

/// `KeyPath` represents the path to a specific node in a tree of nested dictionaries.
///
/// Can be created from string and array literals and can be joined by the `=>` operator.
/// ```
/// let a: KeyPath = "a"
/// let b: KeyPath = ["a", "b"]
/// let c: KeyPath = "a" => "b" => "c"
/// ```

public struct KeyPath {
    var keys: [String]
    
    public init(_ keys: [String]) {
        self.keys = keys
    }
    
    public init(_ key: String) {
        self.keys = [key]
    }
    
}

extension KeyPath: StringLiteralConvertible {
    public init(stringLiteral value: String) {
        self.keys = [value]
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.keys = [value]
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.keys = [value]
    }
}

extension KeyPath: ArrayLiteralConvertible {
    public init(arrayLiteral elements: String...) {
        self.keys = elements
    }
}

public struct OptionalKey {
    var key: String
    var isRequired: Bool
}

public struct OptionalKeyPath {
    var keys: [OptionalKey]
}

extension OptionalKeyPath: StringLiteralConvertible {
    public init(stringLiteral value: String) {
        self.keys = [OptionalKey(key: value, isRequired: false)]
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self.keys = [OptionalKey(key: value, isRequired: false)]
    }
    
    public init(unicodeScalarLiteral value: String) {
        self.keys = [OptionalKey(key: value, isRequired: false)]
    }
}

extension OptionalKeyPath: ArrayLiteralConvertible {
    public init(arrayLiteral elements: String...) {
        self.keys = elements.map { OptionalKey(key: $0, isRequired: false) }
    }
}
