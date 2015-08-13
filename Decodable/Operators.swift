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


public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T {
    let path = rhs.toJSONPathArray()
    return try parse(lhs, path: path, decode: T.decode)
}

public func => (lhs: AnyObject, rhs: String) throws -> NSDictionary {
    return try parse(lhs, path: rhs.toJSONPathArray(), decode: NSDictionary.decode)
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> T? {
    return catchAndPrint { try parse(lhs, path: rhs.toJSONPathArray(), decode: T.decode) }
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    return try parseArray(lhs, path: rhs.toJSONPathArray())
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> [T]? {
    return catchAndPrint { try parse(lhs, path: rhs.toJSONPathArray(), decode: decodeArray(false)) }
}

public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    return try parse(lhs, path: rhs.toJSONPathArray(), decode: decodeArray(true))
}

/*
func => (lhs: AnyObject, rhs: String) throws -> AnyObject {
    return try parse(lhs, path: rhs.toJSONPathArray())
}
*/

// MARK: - JSONPath

func => (lhs: String, rhs: String) -> String {
    return lhs + JSONPathSeparator + rhs
}

private let JSONPathSeparator = "<\">" // <"> should be illegal JSON key, because of the unescaped ". <> are for readability
private extension String {
    func toJSONPathArray() -> [String] {
        return (self as NSString).componentsSeparatedByString(JSONPathSeparator)
    }
}