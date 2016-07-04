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

/*
public func => (lhs: AnyObject, rhs: String) throws -> AnyObject {
    return try parse(lhs, path: [rhs], decode: { $0 })
}

public func =>? (lhs: AnyObject, rhs: String) throws -> AnyObject? {
    return try parseAndAcceptMissingKey(lhs, path: [rhs] , decode: { $0 })
}

public func => (lhs: AnyObject, rhs: [String]) throws -> AnyObject {
    return try parse(lhs, path: rhs, decode: { $0 })
}

public func =>? (lhs: AnyObject, rhs: [String]) throws -> AnyObject? {
    return try parseAndAcceptMissingKey(lhs, path: rhs, decode: { $0 })
}
 */


// MARK: - JSONPath

/// Enables parsing nested objects e.g json => "a" => "b"
public func => (lhs: String, rhs: String) -> [String] {
    return [lhs, rhs]
}

public func => (lhs: String, rhs: [String]) -> [String] {
    return [lhs] + rhs
}

