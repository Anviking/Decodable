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

public func => (lhs: AnyObject, rhs: KeyPath) throws -> AnyObject {
    return try parse(lhs, keyPath: rhs, decode: { $0 })
}


public func =>? (lhs: AnyObject, rhs: OptionalKeyPath) throws -> AnyObject? {
    return try parseAndAcceptMissingKey(lhs, keyPath: rhs, decode: { $0 })
}


// MARK: - JSONPath

/// Enables parsing nested objects e.g json => "a" => "b"

public func => (lhs: KeyPath, rhs: KeyPath) -> KeyPath {
    return KeyPath(lhs.keys + rhs.keys)
}


public func => (lhs: OptionalKeyPath, rhs: OptionalKeyPath) -> OptionalKeyPath {
    return OptionalKeyPath(keys: lhs.keys + rhs.keys)
}

public func => (lhs: OptionalKeyPath, rhs: KeyPath) -> OptionalKeyPath {
    return OptionalKeyPath(keys: lhs.keys + rhs.keys.map { OptionalKey(key: $0, isRequired: true) })
}

// MARK: Helpers

func catchNull<T>(_ decodeClosure: (AnyObject) throws -> T) -> (AnyObject) throws -> T? {
    return { json in
        if json is NSNull {
            return nil
        } else {
            return try decodeClosure(json)
        }
    }
}
