//
// OptionalKey.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-29.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

// Keep it simple for now

protocol KeyType {
    var key: String {get}
}

protocol OptionalKeyType {
    var key: String {get}
    var optional: Bool {get set}
}

public struct Key: KeyType {
    let key: String
}

public struct OptionalKey: OptionalKeyType {
    var key: String
    var optional: Bool
}

private func makeOptional(key: Key) -> OptionalKey {
    return OptionalKey(key: key.key, optional: false)
}

extension Array where Element: OptionalKeyType {
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
    func markFirstElement(optional: Bool) -> [OptionalKey] {
        guard let first = first else {
            return []
        }
        return [OptionalKey(key: first.key, optional: true)] + dropLast().map { OptionalKey(key: $0.key, optional: false) }
    }
}


public func => (lhs: String, rhs: String) -> [Key] {
    return [Key(key: lhs), Key(key: rhs)]
}

public func =>? (lhs: String, rhs: String) -> [OptionalKey] {
    return [OptionalKey(key: lhs, optional: false), OptionalKey(key: rhs, optional: true)]
}

public func => (lhs: String, rhs: [OptionalKey]) -> [OptionalKey] {
    return [OptionalKey(key: lhs, optional: false)] + rhs.markFirstElement(false)
}

public func => (lhs: String, rhs: [Key]) -> [Key] {
    return [Key(key: lhs)] + rhs
}

public func =>? (lhs: String, rhs: [OptionalKey]) -> [OptionalKey] {
    return [OptionalKey(key: lhs, optional: true)] + rhs.markFirstElement(true)
}

public func =>? (lhs: String, rhs: [Key]) -> [OptionalKey] {
    return [OptionalKey(key: lhs, optional: true)] + rhs.markFirstElement(true)
}


public func => (lhs: [Key], rhs: Key) -> [Key] {
    return lhs + [rhs]
}

