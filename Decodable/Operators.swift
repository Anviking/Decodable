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

// MARK: =>

/// Try to decode as T, or throw
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T {
    return try parse(lhs, path: rhs, decode: T.decode)
}

/// Do not decode. Without an inferred return type, this overload will be called.
public func => (lhs: AnyObject, rhs: String) throws -> AnyObject {
    return try parse(lhs, path: rhs, decode: { $0 })
}

/// Try to decode as T, or throw. Will return nil if the object at the keypath is NSNull.
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T? {
    return try catchNull { try parse(lhs, path: rhs, decode: T.decode) }
}

// MARK: Arrays

/// Try to decode as NSArray, and decode each element as T. Will throw if decoding of any element in the array throws. I.e, if one element is faulty the entire array is "thrown away".
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    return try parse(lhs, path: rhs, decode: decodeArray(ignoreInvalidObjects: false))
}

/// Try to decode as NSArray, and decode each element as T. Will return nil if the object at the keypath is NSNull. Will throw if decoding of any element in the array throws. I.e, if one element is faulty the entire array is "thrown away".
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]? {
    return try catchNull { try parse(lhs, path: rhs, decode: decodeArray(ignoreInvalidObjects: false)) }
}

/// Try to decode as NSArray, and decode each element as T or nil, if the element is NSNull.
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T?] {
    return try parse(lhs, path: rhs, decode: decodeArray)
}


// MARK: - JSONPath

/// Enables parsing nested objects e.g json => "a" => "b"
/// Uses \u{0} (null) as a separator
public func => (lhs: String, rhs: String) -> String {
    return lhs + JSONPathSeparator + rhs
}

// You can't have this in a key. Sorry.
// This dramatically simplifies the implementation, halves the number of overloads required.
// If this is a bad idea, please tell me.
// http://stackoverflow.com/questions/1879860/most-reliable-split-character
private let JSONPathSeparator = String("\u{0}")

private extension String {
    func toJSONPathArray() -> [String] {
        return componentsSeparatedByString(JSONPathSeparator)
    }
}

// MARK: Helper

private func parse<T>(json: AnyObject, path: String, decode: (AnyObject throws -> T)) throws -> T {
    return try parse(json, path: path.toJSONPathArray(), decode: decode)
}

