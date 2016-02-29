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

// MARK: Helpers

func catchNull<T>(decodeClosure: (AnyObject) throws -> T) -> (AnyObject) throws -> T? {
    return { json in
        if json is NSNull {
            return nil
        } else {
            return try decodeClosure(json)
        }
    }
}
