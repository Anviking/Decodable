//
//  OptionalKeyPath.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-09.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

/// A key in a keyPath that may or may not be required.
/// 
/// Trying to access a invalid key in a dictionary with an `OptionalKey` will usually result
/// in a nil return value instead of a thrown error. Unless `isRequired` is `true`, in which 
/// it behaves as a "normal" `String` inside a "normal" `KeyPath`.
public struct OptionalKey {
    public var key: String
    public var isRequired: Bool
}

extension OptionalKey: CustomStringConvertible {
    public var description: String {
        return key + (isRequired ? "" : "?")
    }
}

/// `OptionalKeyPath` represents the path to a specific node in a tree of nested dictionaries.
///
/// Can be created from string and array literals and can be joined by the `=>?` operator.
/// ```
/// let a: OptionalKeyPath = "a"
/// let b: OptionalKeyPath = ["a", "b"]
/// let c: OptionalKeyPath = "a" =>? "b" =>? "c"
/// ```
/// Unlike `KeyPath`, `OptionalKeyPath` allows each key to be either required or optional.
///`isRequired` is `false` by default.
///
/// When a `KeyPath` is converted to a OptionalKeyPath, `isRequired` is set to `true`.
/// ```
/// let c: OptionalKeyPath = "a" =>? "b" => "c"
///                                         ^^
///                             isRequired=true
/// ```
/// In the above example `"c"` is inferred as `KeyPath`, then converted to `OptionalKeyPath`
/// with `isRequired = true`

public struct OptionalKeyPath {
    public var keys: [OptionalKey]
    mutating func markFirst(required: Bool) {
        if var first = keys.first {
            first.isRequired = required
            keys[0] = first
        }
    }
    
    func markingFirst(required: Bool) -> OptionalKeyPath {
        var new = self
        if var first = keys.first {
            first.isRequired = required
            new.keys[0] = first
        }
        return new
    }
}

extension OptionalKeyPath: ExpressibleByStringLiteral {
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

extension OptionalKeyPath: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: String...) {
        self.keys = elements.map { OptionalKey(key: $0, isRequired: false) }
    }
}

// MARK: Equality

extension OptionalKey: Equatable {}
public func == (lhs: OptionalKey, rhs: OptionalKey) -> Bool {
    return lhs.key == rhs.key && lhs.isRequired == rhs.isRequired
}
