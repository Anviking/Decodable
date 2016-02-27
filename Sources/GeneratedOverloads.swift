//
//  File.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-27.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A]? {
    return try parse(json, path: path.toJSONPathArray(), decode: catchNull(decodeArray(A.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]? {
    return try parse(json, path: path.toJSONPathArray(), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable>(json: AnyObject, path: String) throws -> A? {
    return try parse(json, path: path.toJSONPathArray(), decode: catchNull(A.decode))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A?] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeArray(catchNull(A.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [[A]] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeArray(decodeArray(A.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeArray(A.decode))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B?] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.
 */
public func => <A: Decodable>(json: AnyObject, path: String) throws -> A {
    return try parse(json, path: path.toJSONPathArray(), decode: A.decode)
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [A]?? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: catchNull(decodeArray(A.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]?? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> A?? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: catchNull(A.decode))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [A?]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeArray(catchNull(A.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [[A]]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeArray(decodeArray(A.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [A]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeArray(A.decode))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B?]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}
/**
 Retrieves the object at `path` from `json` and decodes it according to the return type
 
 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: Rethrows errors thrown in the decode closure.
 */
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> A? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: A.decode)
}
