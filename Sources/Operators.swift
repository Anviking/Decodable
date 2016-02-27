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

public func => (object: AnyObject, rhs: String) throws -> AnyObject {
    return try parse(object, key: rhs)
}

public func =>? (object: AnyObject, rhs: String) throws -> AnyObject? {
    return try? parse(object, key: rhs)
}

public func => (object: AnyObject, rhs: (AnyObject throws -> AnyObject)) throws -> AnyObject {
    return try rhs(object)
}

public func =>? (object: AnyObject, parseClosure: (AnyObject throws -> AnyObject)) throws -> AnyObject? {
    return try parseClosure(object)
}

func parse(object: AnyObject, key: String) throws -> AnyObject {
    return try parse(object, key)
}

public func => (lhs: String, rhs: String) -> (AnyObject throws -> AnyObject) {
    return { json in
        return try parse(parse(json, key: lhs), key: rhs)
    }
}

public func => (lhs: String, rhs: (AnyObject throws -> AnyObject)) -> (AnyObject throws -> AnyObject) {
    return { json in
        return try rhs(parse(json, key: lhs))
    }
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
