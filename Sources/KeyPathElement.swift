//
// OptionalKey.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-29.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

// MARK: - Key and OptionalKey

/// A struct representing an element in a key-path.
public struct Key: KeyType {
    let key: String
}

/// A struct representing an element in an key-path where each element may or may not be optional
public struct OptionalKey: OptionalKeyType {
    var key: String
    var optional: Bool
}

// MARK: - Key and Optional Key Array extensions

// Required for Array extension right now because of Swift
protocol KeyType {
    var key: String {get}
}

// Required for Array extension right now because of Swift
protocol OptionalKeyType {
    var key: String {get}
    var optional: Bool {get set}
}

private func makeOptional(key: Key) -> OptionalKey {
    return OptionalKey(key: key.key, optional: false)
}

extension Array where Element: OptionalKeyType {
    /// Mark the first element as optional
    func markFirstElement(optional: Bool) -> Array {
        guard let _first = self.first else {
            return self
        }
        var first = _first
        first.optional = optional
        return [first] + dropFirst()
    }
}

extension Array where Element: KeyType {
    /// Convert to an array of OptionalKeys, mark the first as optional and the other as not.
    func markFirstElement(optional: Bool) -> [OptionalKey] {
        guard let first = first else {
            return []
        }
        return [OptionalKey(key: first.key, optional: true)] + dropLast().map { OptionalKey(key: $0.key, optional: false) }
    }
}

