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
    associativity: left
    higherThan: CastingPrecedence
}

infix operator =>  : DecodingPrecedence
infix operator =>? : DecodingPrecedence



// Dict -> T
func => <A: Decodable, Key>(container: KeyedDecodingContainer<Key>, key: Key) throws -> A {
    return try decode(container, key)
}

// Dict -> Dict
func => <Key>(container: KeyedDecodingContainer<Key>, key: Key) throws -> KeyedDecodingContainer<Key> {
    return try nested(container, key)
}

// Dict -> Dict?
func => <Key>(container: KeyedDecodingContainer<Key>, key: Key) throws -> KeyedDecodingContainer<Key>? {
    return try lift(nested)(container, key)
}



// Dict? -> Dict?
func =>? <Key>(container: KeyedDecodingContainer<Key>?, key: Key) throws -> KeyedDecodingContainer<Key>? {
    return try lift(nested)(container, key)
}

// Dict? -> Dict
func => <Key>(container: KeyedDecodingContainer<Key>?, key: Key) throws -> KeyedDecodingContainer<Key>? {
    return try container.map { try nested($0, key) }
}

// Dict? -> T
func =>? <T: Decodable, Key>(container: KeyedDecodingContainer<Key>?, key: Key) throws -> T? {
    return try lift(decode)(container, key)
}



// -------------------------
// MARK: Private Helpers
// -------------------------




private func decode<K, T: Decodable>(_ container: KeyedDecodingContainer<K>, _ key: K) throws -> T {
    return try container.decode(T.self, forKey: key)
}

private func nested<K>(_ container: KeyedDecodingContainer<K>, _ key: K) throws -> KeyedDecodingContainer<K> {
    return try container.nestedContainer(keyedBy: K.self, forKey: key)
}

private func lift<K,T>(_ f: @escaping (KeyedDecodingContainer<K>, K) throws -> T) -> (KeyedDecodingContainer<K>?, K) throws -> T? {
    return { container, key in
        if let container = container, container.contains(key) {
            return try f(container, key)
        } else {
            return nil
        }
    }
}
