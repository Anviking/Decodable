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
    return try parse(lhs, path: rhs.toJSONPathArray(), decode: decodeArray(ignoreInvalidObjects: false))
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> [T]? {
    return catchAndPrint { try parse(lhs, path: rhs.toJSONPathArray(), decode: decodeArray(ignoreInvalidObjects: false)) }
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T?] {
    return try parse(lhs, path: rhs.toJSONPathArray(), decode: decodeArray)
}

public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    return try parse(lhs, path: rhs.toJSONPathArray(), decode: decodeArray(ignoreInvalidObjects: true))
}

// MARK: - JSONPath

public func => (lhs: String, rhs: String) -> String {
    return lhs + JSONPathSeparator + rhs
}

// You can't have this as a JSON key. Sorry.
// This dramatically simplifies the implementation, halves the number of overloads required.
// If this is a bad idea, please tell me.
// http://stackoverflow.com/questions/1879860/most-reliable-split-character
private let JSONPathSeparator = String("\u{0}")

private extension String {
    func toJSONPathArray() -> [String] {
        return componentsSeparatedByString(JSONPathSeparator)
    }
}