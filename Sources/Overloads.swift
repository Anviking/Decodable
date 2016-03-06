//
//  Overloads.swift
//  Decodable
//
//  Generated automatically by Generator.swift as a build phase.
//  Copyright © 2016 anviking. All rights reserved.
//

// 104 overloads were generated with the following return types:
// [A?]?, [[A]]?, [[A: B]]?, [A]?, [A: B?]?, [A: [B]]?, [A: [B: C]]?, [A: B]?, A?, [[A]?], [[A: B]?], [A?], [[A?]], [[[A]]], [[[A: B]]], [[A]], [[A: B?]], [[A: [B]]], [[A: [B: C]]], [[A: B]], [A], [A: [B]?], [A: [B: C]?], [A: B?], [A: [B?]], [A: [[B]]], [A: [[B: C]]], [A: [B]], [A: [B: C?]], [A: [B: [C]]], [A: [B: [C: D]]], [A: [B: C]], [A: B], A

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [A?]? {
return try parse(json, path: path, decode: catchNull(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A?]? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A?]? {
return try parse(json, path: [Key(key: path)], decode: catchNull(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: [Key]) throws -> [A?]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [A?]? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A?]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [[A]]? {
return try parse(json, path: path, decode: catchNull(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [[A]]? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [[A]]? {
return try parse(json, path: [Key(key: path)], decode: catchNull(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: [Key]) throws -> [[A]]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [[A]]? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [[A]]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [[A: B]]? {
return try parse(json, path: path, decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [[A: B]]? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]]? {
return try parse(json, path: [Key(key: path)], decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [[A: B]]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]]? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [[A: B]]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [A]? {
return try parse(json, path: path, decode: catchNull(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A]? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A]? {
return try parse(json, path: [Key(key: path)], decode: catchNull(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: [Key]) throws -> [A]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [A]? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: B?]? {
return try parse(json, path: path, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A: B?]? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B?]? {
return try parse(json, path: [Key(key: path)], decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: B?]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B?]? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A: B?]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B]]? {
return try parse(json, path: path, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A: [B]]? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]]? {
return try parse(json, path: [Key(key: path)], decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B]]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]]? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A: [B]]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B: C]]? {
return try parse(json, path: path, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A: [B: C]]? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]]? {
return try parse(json, path: [Key(key: path)], decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B: C]]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]]? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A: [B: C]]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: B]? {
return try parse(json, path: path, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A: B]? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]? {
return try parse(json, path: [Key(key: path)], decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: B]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> [A: B]? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> A? {
return try parse(json, path: path, decode: catchNull(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> A? {
return try parseOptionally(json, path: path.markFirstElement(false), decode: catchNull(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> A? {
return try parse(json, path: [Key(key: path)], decode: catchNull(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: [Key]) throws -> A? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> A? {
return try parseOptionally(json, path: [OptionalKey(key: path, optional: true)], decode: catchNull(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func =>? <A: Decodable>(json: AnyObject, path: [OptionalKey]) throws -> A? {
return try parseOptionally(json, path: path.markFirstElement(true), decode: catchNull(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [[A]?] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(catchNull(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [[A]?] {
return try parse(json, path: path, decode: decodeArray(catchNull(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]?] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [[A: B]?] {
return try parse(json, path: path, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A?] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(catchNull(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [A?] {
return try parse(json, path: path, decode: decodeArray(catchNull(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [[A?]] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [[A?]] {
return try parse(json, path: path, decode: decodeArray(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [[[A]]] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [[[A]]] {
return try parse(json, path: path, decode: decodeArray(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[[A: B]]] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [[[A: B]]] {
return try parse(json, path: path, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [[A]] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [[A]] {
return try parse(json, path: path, decode: decodeArray(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B?]] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [[A: B?]] {
return try parse(json, path: path, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: [B]]] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [[A: [B]]] {
return try parse(json, path: path, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [[A: [B: C]]] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [Key]) throws -> [[A: [B: C]]] {
return try parse(json, path: path, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [[A: B]] {
return try parse(json, path: path, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A] {
return try parse(json, path: [Key(key: path)], decode: decodeArray(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> [A] {
return try parse(json, path: path, decode: decodeArray(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]?] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B]?] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]?] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B: C]?] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B?] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: B?] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B?]] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B?]] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [[B]]] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [[B]]] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [[B: C]]] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [[B: C]]] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B]] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C?]] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B: C?]] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: [C]]] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B: [C]]] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, path: String) throws -> [A: [B: [C: D]]] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B: [C: D]]] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: [Key]) throws -> [A: [B: C]] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B] {
return try parse(json, path: [Key(key: path)], decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable, B: Decodable>(json: AnyObject, path: [Key]) throws -> [A: B] {
return try parse(json, path: path, decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: String) throws -> A {
return try parse(json, path: [Key(key: path)], decode: A.decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.
*/

public func => <A: Decodable>(json: AnyObject, path: [Key]) throws -> A {
return try parse(json, path: path, decode: A.decode)
}