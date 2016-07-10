//
//  Operators.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

// MARK: - Operators

infix operator => { associativity right precedence 150 }
infix operator =>? { associativity right precedence 150 }


public func => (lhs: AnyObject, rhs: KeyPath) throws -> DecodingContext<Void> {
    let context = DecodingContext(json: lhs, parameters: ())
    return try context.parse(keyPath: rhs)
}


public func =>? (lhs: AnyObject, rhs: OptionalKeyPath) throws -> DecodingContext<Void>? {
    let context = DecodingContext(json: lhs, parameters: ())
    return try context.parse(keyPath: rhs)
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

