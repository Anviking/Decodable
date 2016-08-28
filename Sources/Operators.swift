//
//  Operators.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

// MARK: - Operators

precedencegroup DecodingPrecedence {
    associativity: right
    higherThan: CastingPrecedence
}

infix operator =>  : DecodingPrecedence
infix operator =>? : DecodingPrecedence

public func => (lhs: Any, rhs: KeyPath) throws -> Any {
    return try parse(lhs, keyPath: rhs, decoder: { $0 })
}


public func =>? (lhs: Any, rhs: OptionalKeyPath) throws -> Any? {
    return try parse(lhs, keyPath: rhs, decoder: { $0 })
}


// MARK: - JSONPath

/// Enables parsing nested objects e.g json => "a" => "b"

public func => (lhs: KeyPath, rhs: KeyPath) -> KeyPath {
    return KeyPath(lhs.keys + rhs.keys)
}

public func => (lhs: OptionalKeyPath, rhs: OptionalKeyPath) -> OptionalKeyPath {
    return OptionalKeyPath(keys: lhs.keys + rhs.markingFirst(required: true).keys)
}

public func =>? (lhs: OptionalKeyPath, rhs: OptionalKeyPath) -> OptionalKeyPath {
    return OptionalKeyPath(keys: lhs.keys + rhs.keys)
}

public func => (lhs: OptionalKeyPath, rhs: KeyPath) -> OptionalKeyPath {
    return OptionalKeyPath(keys: lhs.keys + rhs.keys.map { OptionalKey(key: $0, isRequired: true) })
}


public func =>? (lhs: KeyPath, rhs: OptionalKeyPath) -> OptionalKeyPath {
    return OptionalKeyPath(keys: lhs.keys.map { OptionalKey(key: $0, isRequired: true) } + rhs.keys  )
}
