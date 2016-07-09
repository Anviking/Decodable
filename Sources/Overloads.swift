//
//  Overloads.swift
//  Decodable
//
//  Generated automatically by Generator.swift as a build phase.
//  Copyright © 2016 anviking. All rights reserved.
//

// 163 overloads were generated with the following return types:
// [[A]?]?, [[A: B]?]?, [A?]?, [[A?]]?, [[[A]]]?, [[[A: B]]]?, [[A]]?, [[A: B?]]?, [[A: [B]]]?, [[A: [B: C]]]?, [[A: B]]?, [A]?, [A: [B]?]?, [A: [B: C]?]?, [A: B?]?, [A: [B?]]?, [A: [[B]]]?, [A: [[B: C]]]?, [A: [B]]?, [A: [B: C?]]?, [A: [B: [C]]]?, [A: [B: [C: D]]]?, [A: [B: C]]?, [A: B]?, A?, [[A?]?], [[[A]]?], [[[A: B]]?], [[A]?], [[A: B?]?], [[A: [B]]?], [[A: [B: C]]?], [[A: B]?], [A?], [[[A]?]], [[[A: B]?]], [[A?]], [[[A?]]], [[[[A]]]], [[[[A: B]]]], [[[A]]], [[[A: B?]]], [[[A: [B]]]], [[[A: [B: C]]]], [[[A: B]]], [[A]], [[A: [B]?]], [[A: [B: C]?]], [[A: B?]], [[A: [B?]]], [[A: [[B]]]], [[A: [[B: C]]]], [[A: [B]]], [[A: [B: C?]]], [[A: [B: [C]]]], [[A: [B: [C: D]]]], [[A: [B: C]]], [[A: B]], [A], [A: [B?]?], [A: [[B]]?], [A: [[B: C]]?], [A: [B]?], [A: [B: C?]?], [A: [B: [C]]?], [A: [B: [C: D]]?], [A: [B: C]?], [A: B?], [A: [[B]?]], [A: [[B: C]?]], [A: [B?]], [A: [[B?]]], [A: [[[B]]]], [A: [[[B: C]]]], [A: [[B]]], [A: [[B: C?]]], [A: [[B: [C]]]], [A: [[B: [C: D]]]], [A: [[B: C]]], [A: [B]], [A: [B: [C]?]], [A: [B: [C: D]?]], [A: [B: C?]], [A: [B: [C?]]], [A: [B: [[C]]]], [A: [B: [[C: D]]]], [A: [B: [C]]], [A: [B: [C: D?]]], [A: [B: [C: [D]]]], [A: [B: [C: [D: E]]]], [A: [B: [C: D]]], [A: [B: C]], [A: B], A

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A]?]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(catchNull(decodeArray(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B]?]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A?]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A?]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(decodeArray(catchNull(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A]]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(decodeArray(decodeArray(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B]]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B?]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B]]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C]]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B]?]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C]?]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: B?]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B?]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B]]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C]]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C?]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C]]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D]]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C]]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: B]? {
    return try parse(json, keyPath: keyPath, decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> A? {
    return try parse(json, keyPath: keyPath, decode: catchNull(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A?]?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeArray(catchNull(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A]]?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeArray(decodeArray(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B]]?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A]?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B?]?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B]]?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C]]?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B]?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A?] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(catchNull(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A]?]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(catchNull(decodeArray(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B]?]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A?]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A?]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeArray(catchNull(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[[A]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeArray(decodeArray(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[[A: B]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B?]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: [B]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: [B: C]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B]?]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C]?]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B?]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B?]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [[B]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [[B: C]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C?]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: [C]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: [C: D]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C]]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B]] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A] {
    return try parse(json, keyPath: keyPath, decode: decodeArray(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B?]?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B]]?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C]]?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B]?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C?]?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C]]?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D]]?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C]?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: B?] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B]?]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C]?]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B?]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B?]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[[B]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[[B: C]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C?]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: [C]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: [C: D]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C]?]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D]?]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C?]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C?]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [[C]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [[C: D]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D?]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: catchNull(D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: [D]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeArray(D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: [D: E]]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeDictionary(D.decode, elementDecodeClosure: E.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D]]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C]] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: B] {
    return try parse(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> A {
    return try parse(json, keyPath: keyPath, decode: A.decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A?]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeArray(catchNull(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A]]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeArray(decodeArray(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B]]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B?]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B]]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C]]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(catchNull(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A]?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(catchNull(decodeArray(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B]?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(catchNull(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A?]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeArray(catchNull(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[[A]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeArray(decodeArray(A.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[[A: B]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeArray(A.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B?]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: [B]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: [B: C]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[[A: B]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeArray(A.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B]?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C]?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B?]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [[B]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [[B: C]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C?]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: [C]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: [C: D]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: [B: C]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [[A: B]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeArray(A.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B?]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B]]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C]]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C?]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C]]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D]]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C]?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: B?]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B]?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C]?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B?]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(catchNull(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[[B]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeArray(B.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[[B: C]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C?]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: [C]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: [C: D]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [[B: C]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C]?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D]?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C?]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C?]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(catchNull(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [[C]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeArray(C.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [[C: D]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D?]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: catchNull(D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: [D]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeArray(D.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: [D: E]]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeDictionary(D.decode, elementDecodeClosure: E.decode)))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: [C: D]]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: [B: C]]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> [A: B]? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(json: AnyObject, keyPath: KeyPath)throws-> A? {
    return try parseAndAcceptMissingKey(json, keyPath: keyPath, decode: A.decode)
}
