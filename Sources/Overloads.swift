//
//  Overloads.swift
//  Decodable
//
//  Generated automatically by Generator.swift as a build phase.
//  Copyright © 2016 anviking. All rights reserved.
//

// 118 overloads were generated with the following return types:
// [A?]?, [[A]]?, [[String: A]]?, [A]?, [String: A?]?, [String: [A]]?, [String: [String: A]]?, [String: A]?, A?, [[A]?], [[String: A]?], [A?], [[A?]], [[[A]]], [[[String: A]]], [[A]], [[String: A?]], [[String: [A]]], [[String: [String: A]]], [[String: A]], [A], [String: [A]?], [String: [String: A]?], [String: A?], [String: [A?]], [String: [[A]]], [String: [[String: A]]], [String: [A]], [String: [String: A?]], [String: [String: [A]]], [String: [String: [String: A]]], [String: [String: A]], [String: A], A

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [A?]? {
    let decode = catchNull(decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [A?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[A]]? {
    let decode = catchNull(decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[String: A]]? {
    let decode = catchNull(decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[String: A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [A]? {
    let decode = catchNull(decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [A]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: A?]? {
    let decode = catchNull(decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: A?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [A]]? {
    let decode = catchNull(decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [String: A]]? {
    let decode = catchNull(decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [String: A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: A]? {
    let decode = catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: A]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> A? {
    let decode = catchNull(A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> A? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = catchNull(A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[A]?] {
    let decode = decodeArray(catchNull(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[A]?] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(catchNull(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[String: A]?] {
    let decode = decodeArray(catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[String: A]?] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [A?] {
    let decode = decodeArray(catchNull(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [A?] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(catchNull(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[A?]] {
    let decode = decodeArray(decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[A?]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[[A]]] {
    let decode = decodeArray(decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[[A]]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[[String: A]]] {
    let decode = decodeArray(decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[[String: A]]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[A]] {
    let decode = decodeArray(decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[A]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[String: A?]] {
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[String: A?]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[String: [A]]] {
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[String: [A]]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[String: [String: A]]] {
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[String: [String: A]]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[String: A]] {
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [[String: A]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [A] {
    let decode = decodeArray(A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [A] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [A]?] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [A]?] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [String: A]?] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [String: A]?] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: A?] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: A?] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [A?]] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [A?]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [[A]]] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [[A]]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [[String: A]]] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [[String: A]]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [A]] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [A]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [String: A?]] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [String: A?]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [String: [A]]] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [String: [A]]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [String: [String: A]]] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [String: [String: A]]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: [String: A]] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: [String: A]] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [String: A] {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> [String: A] {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> A {
    let decode = A.decode
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: KeyPath)throws-> A {
    let context = DecodingContext(json: json, parameters: ())
    let decode = A.decode
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[A]?]? {
    let decode = decodeArray(catchNull(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[A]?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(catchNull(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[String: A]?]? {
    let decode = decodeArray(catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[String: A]?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [A?]? {
    let decode = decodeArray(catchNull(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [A?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(catchNull(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[A?]]? {
    let decode = decodeArray(decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[A?]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[[A]]]? {
    let decode = decodeArray(decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[[A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[[String: A]]]? {
    let decode = decodeArray(decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[[String: A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[A]]? {
    let decode = decodeArray(decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[String: A?]]? {
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[String: A?]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[String: [A]]]? {
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[String: [A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[String: [String: A]]]? {
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[String: [String: A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[String: A]]? {
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[String: A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [A]? {
    let decode = decodeArray(A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [A]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [A]?]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [A]?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [String: A]?]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [String: A]?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: A?]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: A?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [A?]]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [A?]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [[A]]]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [[A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [[String: A]]]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [[String: A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [A]]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [String: A?]]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [String: A?]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: catchNull(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [String: [A]]]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [String: [A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: decodeArray(A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [String: [String: A]]]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [String: [String: A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode)))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: [String: A]]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: [String: A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: decodeDictionary(String.decode, elementDecodeClosure: A.decode))
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [String: A]? {
    let decode = decodeDictionary(String.decode, elementDecodeClosure: A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [String: A]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeDictionary(String.decode, elementDecodeClosure: A.decode)
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> A? {
    let decode = A.decode
    return try context.decode(keyPath: keyPath, decode: decode)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> A? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = A.decode
    return try context.decode(keyPath: keyPath, decode: decode)
}