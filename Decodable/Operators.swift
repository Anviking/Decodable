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
    return try parse(lhs, path: rhs, decode: catchNull(T.decode))
}

// MARK: Arrays

/// Try to decode as NSArray, and decode each element as T. Will throw if decoding of any element in the array throws. I.e, if one element is faulty the entire array is "thrown away".
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    return try parse(lhs, path: rhs, decode: decodeArray(T.decode))
}

/// Try to decode as NSArray, and decode each element as T. Will return nil if the object at the keypath is NSNull. Will throw if decoding of any element in the array throws. I.e, if one element is faulty the entire array is "thrown away".
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]? {
    return try parse(lhs, path: rhs, decode: catchNull(decodeArray(T.decode)))
}

/// Try to decode as NSArray, and decode each element as T or nil, if the element is NSNull.
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T?] {
    return try parse(lhs, path: rhs, decode: decodeArray(catchNull(T.decode)))
}

/// Try to decode as NSArray, and decode each element as T or nil, if the element is NSNull, and the entire array will also be nil if the object at the keypath is NSNull.
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T?]? {
    return try parse(lhs, path: rhs, decode: catchNull(decodeArray(catchNull(T.decode))))
}

// MARK: Dictionary 

/// Try to decode as NSDictionary. Map the dictionary using the decode function on K and T. Does not handle, or object to duplicate keys (last to be set wins).
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [String: T] {
    return try parse(lhs, path: rhs, decode: decodeDictionary(String.decode)(elementDecodeClosure: T.decode))
}

/// Try to decode as NSDictionary?. Returns nil if object at path is NSNull. Map the dictionary using the decode function on K and T. Does not handle, or object to duplicate keys (last to be set wins).
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [String: T]? {
    return try parse(lhs, path: rhs, decode: catchNull(decodeDictionary(String.decode)(elementDecodeClosure: T.decode)))
}

/// Try to decode as NSDictionary?. Returns nil if object at path is NSNull. Maps key with K.decode. This is a workaround to ensure that there is only one => overload without generic types to avoid ambiguity.
public func => <K: Decodable>(lhs: AnyObject, rhs: String) throws -> [K: AnyObject]? {
    return try parse(lhs, path: rhs, decode: catchNull(decodeDictionary(K.decode)(elementDecodeClosure: {$0})))
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

private func parse<T>(json: AnyObject, path: String, decode: (AnyObject throws -> T)) throws -> T {
    return try parse(json, path: path.toJSONPathArray(), decode: decode)
}

