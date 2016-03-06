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

// MARK: Implicit overloads (AnyObject)

public func => (lhs: AnyObject, rhs: String) throws -> AnyObject {
    return try parse(lhs, path: [Key(key: rhs)], decode: { $0 })
}

public func =>? (lhs: AnyObject, rhs: OptionalKey) throws -> AnyObject? {
    return try parseOptionally(lhs, path: [rhs], decode: { $0 })
}

public func => (lhs: AnyObject, rhs: [Key]) throws -> AnyObject {
    return try parse(lhs, path: rhs, decode: { $0 })
}

public func =>? (lhs: AnyObject, rhs: [OptionalKey]) throws -> AnyObject? {
    return try parseOptionally(lhs, path: rhs, decode: { $0 })
}

// MARK: - Generic Overloads

/*
 json => "a" => "b" => "c" Return type: T
 json => "a" => "b" =>? "c" // only c is optional. Return type: T?
 json => "a" =>? "b" =>? "c" // b and c is optional. Return type: T?
 json =>? "a" =>? "b" =>? "c" // a, b and c is optional. Return type: T?
 */

// MARK: Step one: b => c

public func => (lhs: String, rhs: String) -> [Key] {
    return [Key(key: lhs), Key(key: rhs)]
}

public func =>? (lhs: String, rhs: String) -> [OptionalKey] {
    return [OptionalKey(key: lhs, optional: false), OptionalKey(key: rhs, optional: true)]
}

// MARK: Step two: a => (b => c)

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

// Step three is generated, see Overloads.swift
