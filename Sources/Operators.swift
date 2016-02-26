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

public func => <A: Decodable>(json: AnyObject, path: String) throws -> A?? {
    return try parse(json, path: path, decode: catchNull(catchNull(A.decode)))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A]? {
    return try parse(json, path: path, decode: catchNull(decodeArray(A.decode)))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]? {
    return try parse(json, path: path, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> A? {
    return try parse(json, path: path, decode: catchNull(A.decode))
}
public func => (json: AnyObject, path: String) throws -> AnyObject? {
    return try parse(json, path: path, decode: catchNull({$0}))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A?] {
    return try parse(json, path: path, decode: decodeArray(catchNull(A.decode)))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [[A]] {
    return try parse(json, path: path, decode: decodeArray(decodeArray(A.decode)))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]] {
    return try parse(json, path: path, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A] {
    return try parse(json, path: path, decode: decodeArray(A.decode))
}
public func => (json: AnyObject, path: String) throws -> [AnyObject] {
    return try parse(json, path: path, decode: decodeArray({$0}))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B?] {
    return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]] {
    return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]] {
    return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B] {
    return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A: AnyObject] {
    return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: {$0}))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> A {
    return try parse(json, path: path, decode: A.decode)
}
public func => (json: AnyObject, path: String) throws -> AnyObject {
    return try parse(json, path: path, decode: {$0})
}



// MARK: =>?

/// Do not decode. Without an inferred return type, this overload will be called. Will return nil if the object at the keypath is NSNull or the keypath is missing.
public func =>? (lhs: AnyObject, rhs: String) throws -> AnyObject? {
    return try parseAndAcceptMissingKey(lhs, path: rhs, decode: { $0 })
}

/// Try to decode as T, or throw. Will return nil if the object at the keypath is NSNull or the keypath is missing.
public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T? {
    return try parseAndAcceptMissingKey(lhs, path: rhs, decode: T.decode)
}

// MARK: Arrays

/// Try to decode as NSArray, and decode each element as T. Will return nil if the object at the keypath is NSNull or the keypath is missing. Will throw if decoding of any element in the array throws. I.e, if one element is faulty the entire array is "thrown away".
public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]? {
    return try parseAndAcceptMissingKey(lhs, path: rhs, decode: decodeArray(T.decode))
}

/// Try to decode as NSArray, and decode each element as T or nil, if the element is NSNull. Will return nil if the object at the keypath is NSNull or the keypath is missing.
public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T?]? {
    return try parseAndAcceptMissingKey(lhs, path: rhs, decode: decodeArray(catchNull(T.decode)))
}

// MARK: Dictionary

/// Try to decode as NSDictionary?. Returns nil if the object at the keypath is NSNull or the keypath is missing. Maps the dictionary using the decode function on K and T. Does not handle, or object to duplicate keys (last to be set wins).
public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [String: T]? {
    return try parseAndAcceptMissingKey(lhs, path: rhs, decode: decodeDictionary(String.decode, elementDecodeClosure: T.decode) )
}

/// Try to decode as NSDictionary?. Returns nil if object at the keypath is NSNull or the keypath is missing. Maps key with K.decode. This is a workaround to ensure that there is only one => overload without generic types to avoid ambiguity.
public func =>? <K: Decodable>(lhs: AnyObject, rhs: String) throws -> [K: AnyObject]? {
    return try parseAndAcceptMissingKey(lhs, path: rhs, decode: decodeDictionary(K.decode, elementDecodeClosure: {$0}))
}

/// FIXME: Documentation and more overloads
public func =>? <K: Decodable, T: Decodable>(lhs: AnyObject, rhs: String) throws -> [K: [T]]? {
    return try parseAndAcceptMissingKey(lhs, path: rhs, decode: decodeDictionary(K.decode, elementDecodeClosure: decodeArray(T.decode)))
}



// MARK: - JSONPath

/// Enables parsing nested objects e.g json => "a" => "b"
/// Uses \u{0} (null) as a separator
public func => (lhs: String, rhs: String) -> String {
    return lhs + String(JSONPathSeparator) + rhs
}

// You can't have this in a key. Sorry.
// This dramatically simplifies the implementation, halves the number of overloads required.
// If this is a bad idea, please tell me.
// http://stackoverflow.com/questions/1879860/most-reliable-split-character
private let JSONPathSeparator = Character("\u{0}")

private extension String {
    func toJSONPathArray() -> [String] {
		return self.characters.split(JSONPathSeparator).map(String.init)
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

private func parseAndAcceptMissingKey<T>(json: AnyObject, path: String, decode: (AnyObject throws -> T)) throws -> T? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decode)
}

