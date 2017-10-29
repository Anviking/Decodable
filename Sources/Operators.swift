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

// Dict -> T
func => <A: Decodable, Key>(container: KeyedDecodingContainer<Key>, key: Key) throws -> A {
    return try container.decode(A.self, forKey: key)
}

// Dict -> Dict
func => <Key>(container: KeyedDecodingContainer<Key>, key: Key) throws -> KeyedDecodingContainer<Key> {
    return try container.nestedContainer(keyedBy: Key.self, forKey: key)
}

// Dict -> Dict?
func => <Key>(container: KeyedDecodingContainer<Key>, key: Key) throws -> KeyedDecodingContainer<Key>? {
    if container.contains(key) {
        return try container.nestedContainer(keyedBy: Key.self, forKey: key)
    } else {
        return nil
    }
}

// Dict? -> Dict?
func =>? <Key>(container: KeyedDecodingContainer<Key>?, key: Key) throws -> KeyedDecodingContainer<Key>? {
    if let container = container, container.contains(key) {
        return try container.nestedContainer(keyedBy: Key.self, forKey: key)
    } else {
        return nil
    }
}

// Dict? -> Dict
func => <Key>(container: KeyedDecodingContainer<Key>?, key: Key) throws -> KeyedDecodingContainer<Key>? {
    return try container?.nestedContainer(keyedBy: Key.self, forKey: key)
}
