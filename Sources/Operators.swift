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

public func => (object: AnyObject, key: String) throws -> AnyObject {
    return try parse(object, key)
}

public func =>? (object: AnyObject, key: String) throws -> AnyObject? {
    return try? parse(object, key)
}

public func => (object: AnyObject, rhs: (AnyObject throws -> AnyObject)) throws -> AnyObject {
    return try rhs(object)
}

public func =>? (object: AnyObject, parseClosure: (AnyObject throws -> AnyObject)) throws -> AnyObject? {
    return try parseClosure(object)
}

public func => (lhs: String, rhs: String) -> (AnyObject throws -> AnyObject) {
    return { json in
        return try propagate(json, lhs) {
            try parse(
                propagate(json, lhs) { try parse(json, lhs
                    ) }, rhs)
        }
    }
}

public func => (key: String, rhs: (AnyObject throws -> AnyObject)) -> (AnyObject throws -> AnyObject) {
    return { json in
        return try propagate(json, key) { try rhs(parse(json, key)) }
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
