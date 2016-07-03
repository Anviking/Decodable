//
//  Overloads.swift
//  Decodable
//
//  Generated automatically by Generator.swift as a build phase.
//  Copyright © 2016 anviking. All rights reserved.
//

// 10 overloads were generated with the following return types:
// A?, [A], A

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, path: String)throws-> A? {
    let decode = catchNull(A.decode)
    let object = try context.parse(keys: [path])
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, path: [String])throws-> A? {
    let decode = catchNull(A.decode)
    let object = try context.parse(keys: path)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, path: String)throws-> [A] {
    let decode = decodeArray(A.decode)
    let object = try context.parse(keys: [path])
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, path: [String])throws-> [A] {
    let decode = decodeArray(A.decode)
    let object = try context.parse(keys: path)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, path: String)throws-> A {
    let decode = A.decode
    let object = try context.parse(keys: [path])
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, path: [String])throws-> A {
    let decode = A.decode
    let object = try context.parse(keys: path)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, path: String)throws-> [A]? {
    let decode = decodeArray(A.decode)
    guard let object = try context.parseAndAcceptMissingKeys(keys: [path]) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, path: [String])throws-> [A]? {
    let decode = decodeArray(A.decode)
    guard let object = try context.parseAndAcceptMissingKeys(keys: path) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, path: String)throws-> A? {
    let decode = A.decode
    guard let object = try context.parseAndAcceptMissingKeys(keys: [path]) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, path: [String])throws-> A? {
    let decode = A.decode
    guard let object = try context.parseAndAcceptMissingKeys(keys: path) else { return nil }
    return try decode(object)
}