//
//  Overloads.swift
//  Decodable
//
//  Generated automatically by Generator.swift as a build phase.
//  Copyright © 2016 anviking. All rights reserved.
//

// 36 overloads were generated with the following return types:
// [A?]?, [[A]]?, [A]?, A?, [[A]?], [A?], [[A?]], [[[A]]], [[A]], [A], A

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [A?]? {
    let decode = catchNull(decodeArray(catchNull(A.decode)))
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[A]?] {
    let decode = decodeArray(catchNull(decodeArray(A.decode)))
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [A?] {
    let decode = decodeArray(catchNull(A.decode))
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[A?]] {
    let decode = decodeArray(decodeArray(catchNull(A.decode)))
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[[A]]] {
    let decode = decodeArray(decodeArray(decodeArray(A.decode)))
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [[A]] {
    let decode = decodeArray(decodeArray(A.decode))
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> [A] {
    let decode = decodeArray(A.decode)
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `missingKeyError` if `path` does not exist in `json`. `typeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: KeyPath)throws-> A {
    let decode = A.decode
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
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
    let object = try context.parse(keyPath: keyPath)
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[A]?]? {
    let decode = decodeArray(catchNull(decodeArray(A.decode)))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[A]?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(catchNull(decodeArray(A.decode)))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [A?]? {
    let decode = decodeArray(catchNull(A.decode))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [A?]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(catchNull(A.decode))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[A?]]? {
    let decode = decodeArray(decodeArray(catchNull(A.decode)))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[A?]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(catchNull(A.decode)))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[[A]]]? {
    let decode = decodeArray(decodeArray(decodeArray(A.decode)))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[[A]]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(decodeArray(A.decode)))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [[A]]? {
    let decode = decodeArray(decodeArray(A.decode))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [[A]]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(decodeArray(A.decode))
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> [A]? {
    let decode = decodeArray(A.decode)
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> [A]? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = decodeArray(A.decode)
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(context: DecodingContext<A.Parameters>, keyPath: OptionalKeyPath)throws-> A? {
    let decode = A.decode
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable where A.Parameters == Void>(json: AnyObject, keyPath: OptionalKeyPath)throws-> A? {
    let context = DecodingContext(json: json, parameters: ())
    let decode = A.decode
    guard let object = try context.parse(keyPath: keyPath) else { return nil }
    return try decode(object)
}