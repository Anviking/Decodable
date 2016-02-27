//
//  Overloads.swift
//  Decodable
//
//  Generated automatically by Generator.swift as a build phase.
//  Copyright © 2016 anviking. All rights reserved.
//

// 326 overloads were generated with the following return types:
// [[A]?]?, [[A: B]?]?, [A?]?, [[A?]]?, [[[A]]]?, [[[A: B]]]?, [[A]]?, [[A: B?]]?, [[A: [B]]]?, [[A: [B: C]]]?, [[A: B]]?, [A]?, [A: [B]?]?, [A: [B: C]?]?, [A: B?]?, [A: [B?]]?, [A: [[B]]]?, [A: [[B: C]]]?, [A: [B]]?, [A: [B: C?]]?, [A: [B: [C]]]?, [A: [B: [C: D]]]?, [A: [B: C]]?, [A: B]?, A?, [[A?]?], [[[A]]?], [[[A: B]]?], [[A]?], [[A: B?]?], [[A: [B]]?], [[A: [B: C]]?], [[A: B]?], [A?], [[[A]?]], [[[A: B]?]], [[A?]], [[[A?]]], [[[[A]]]], [[[[A: B]]]], [[[A]]], [[[A: B?]]], [[[A: [B]]]], [[[A: [B: C]]]], [[[A: B]]], [[A]], [[A: [B]?]], [[A: [B: C]?]], [[A: B?]], [[A: [B?]]], [[A: [[B]]]], [[A: [[B: C]]]], [[A: [B]]], [[A: [B: C?]]], [[A: [B: [C]]]], [[A: [B: [C: D]]]], [[A: [B: C]]], [[A: B]], [A], [A: [B?]?], [A: [[B]]?], [A: [[B: C]]?], [A: [B]?], [A: [B: C?]?], [A: [B: [C]]?], [A: [B: [C: D]]?], [A: [B: C]?], [A: B?], [A: [[B]?]], [A: [[B: C]?]], [A: [B?]], [A: [[B?]]], [A: [[[B]]]], [A: [[[B: C]]]], [A: [[B]]], [A: [[B: C?]]], [A: [[B: [C]]]], [A: [[B: [C: D]]]], [A: [[B: C]]], [A: [B]], [A: [B: [C]?]], [A: [B: [C: D]?]], [A: [B: C?]], [A: [B: [C?]]], [A: [B: [[C]]]], [A: [B: [[C: D]]]], [A: [B: [C]]], [A: [B: [C: D?]]], [A: [B: [C: [D]]]], [A: [B: [C: [D: E]]]], [A: [B: [C: D]]], [A: [B: C]], [A: B], A

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[A]?]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(catchNull(decodeArray(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A]?]? {
    return try catchNull(decodeArray(catchNull(decodeArray(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B]?]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B]?]? {
    return try catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [A?]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(catchNull(A.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A?]? {
    return try catchNull(decodeArray(catchNull(A.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[A?]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(decodeArray(catchNull(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A?]]? {
    return try catchNull(decodeArray(decodeArray(catchNull(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[[A]]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(decodeArray(decodeArray(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A]]]? {
    return try catchNull(decodeArray(decodeArray(decodeArray(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B]]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B]]]? {
    return try catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[A]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(decodeArray(A.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A]]? {
    return try catchNull(decodeArray(decodeArray(A.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B?]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B?]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B]]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C]]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [A]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeArray(A.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A]? {
    return try catchNull(decodeArray(A.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B]?]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C]?]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: B?]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: B?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B?]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B?]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B]]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C]]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C?]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C?]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C]]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D]]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C]]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: B]? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: B]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> A? {
    return try propagate(object, key) { try object |> parse(key) |>  catchNull(A.decode) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Returns: nil if the pre-decoded object at `path` is `NSNull`.
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> A? {
    return try catchNull(A.decode)(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[A?]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(decodeArray(catchNull(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A?]?] {
    return try decodeArray(catchNull(decodeArray(catchNull(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[[A]]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(decodeArray(decodeArray(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A]]?] {
    return try decodeArray(catchNull(decodeArray(decodeArray(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B]]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B]]?] {
    return try decodeArray(catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[A]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(decodeArray(A.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A]?] {
    return try decodeArray(catchNull(decodeArray(A.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B?]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B?]?] {
    return try decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B]]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B]]?] {
    return try decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C]]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C]]?] {
    return try decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B]?] {
    return try decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [A?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(catchNull(A.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A?] {
    return try decodeArray(catchNull(A.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[[A]?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(catchNull(decodeArray(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A]?]] {
    return try decodeArray(decodeArray(catchNull(decodeArray(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B]?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B]?]] {
    return try decodeArray(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[A?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(catchNull(A.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A?]] {
    return try decodeArray(decodeArray(catchNull(A.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[[A?]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(decodeArray(catchNull(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A?]]] {
    return try decodeArray(decodeArray(decodeArray(catchNull(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[[[A]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(decodeArray(decodeArray(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[[A]]]] {
    return try decodeArray(decodeArray(decodeArray(decodeArray(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[[A: B]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[[A: B]]]] {
    return try decodeArray(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[[A]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(decodeArray(A.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A]]] {
    return try decodeArray(decodeArray(decodeArray(A.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B?]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B?]]] {
    return try decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: [B]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: [B]]]] {
    return try decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[[A: [B: C]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: [B: C]]]] {
    return try decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B]]] {
    return try decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [[A]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeArray(A.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A]] {
    return try decodeArray(decodeArray(A.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B]?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B]?]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C]?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C]?]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B?]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B?]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B?]]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [[B]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [[B]]]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [[B: C]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [[B: C]]]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B]]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C?]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C?]]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: [C]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: [C]]]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: [C: D]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: [C: D]]]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C]]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B]] {
    return try decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> [A] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeArray(A.decode) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A] {
    return try decodeArray(A.decode)(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B?]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B?]?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B]]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B]]?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C]]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C]]?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B]?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C?]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C?]?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C]]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C]]?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D]]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D]]?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C]?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C]?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: B?] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: B?] {
    return try decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B]?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B]?]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C]?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C]?]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B?]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B?]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B?]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[[B]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[[B]]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[[B: C]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[[B: C]]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C?]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C?]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: [C]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: [C]]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: [C: D]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: [C: D]]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C]?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeArray(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C]?]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeArray(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D]?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeDictionary(C.decode, elementDecodeClosure: D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D]?]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeDictionary(C.decode, elementDecodeClosure: D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C?]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C?]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C?]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(catchNull(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C?]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(catchNull(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [[C]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeArray(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [[C]]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeArray(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [[C: D]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeDictionary(C.decode, elementDecodeClosure: D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [[C: D]]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeDictionary(C.decode, elementDecodeClosure: D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D?]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: catchNull(D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D?]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: catchNull(D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: [D]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeArray(D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: [D]]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeArray(D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: [D: E]]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeDictionary(D.decode, elementDecodeClosure: E.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: [D: E]]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeDictionary(D.decode, elementDecodeClosure: E.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D]]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D]]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C]] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C]] {
    return try decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: B] {
    return try propagate(object, key) { try object |> parse(key) |>  decodeDictionary(A.decode, elementDecodeClosure: B.decode) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: B] {
    return try decodeDictionary(A.decode, elementDecodeClosure: B.decode)(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, key: String)throws-> A {
    return try propagate(object, key) { try object |> parse(key) |>  A.decode }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
 - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure
*/
public func => <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> A {
    return try A.decode(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[A?]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(decodeArray(catchNull(A.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A?]?]? {
    return try catchNull(decodeArray(catchNull(decodeArray(catchNull(A.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[[A]]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(decodeArray(decodeArray(A.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A]]?]? {
    return try catchNull(decodeArray(catchNull(decodeArray(decodeArray(A.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B]]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B]]?]? {
    return try catchNull(decodeArray(catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[A]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(decodeArray(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A]?]? {
    return try catchNull(decodeArray(catchNull(decodeArray(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B?]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B?]?]? {
    return try catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B]]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B]]?]? {
    return try catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C]]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C]]?]? {
    return try catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B]?]? {
    return try catchNull(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [A?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(catchNull(A.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A?]? {
    return try catchNull(decodeArray(catchNull(A.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[[A]?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(catchNull(decodeArray(A.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A]?]]? {
    return try catchNull(decodeArray(decodeArray(catchNull(decodeArray(A.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B]?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B]?]]? {
    return try catchNull(decodeArray(decodeArray(catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[A?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(catchNull(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A?]]? {
    return try catchNull(decodeArray(decodeArray(catchNull(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[[A?]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(decodeArray(catchNull(A.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A?]]]? {
    return try catchNull(decodeArray(decodeArray(decodeArray(catchNull(A.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[[[A]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(decodeArray(decodeArray(A.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[[A]]]]? {
    return try catchNull(decodeArray(decodeArray(decodeArray(decodeArray(A.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[[A: B]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[[A: B]]]]? {
    return try catchNull(decodeArray(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[[A]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(decodeArray(A.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A]]]? {
    return try catchNull(decodeArray(decodeArray(decodeArray(A.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B?]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B?]]]? {
    return try catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: [B]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: [B]]]]? {
    return try catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[[A: [B: C]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: [B: C]]]]? {
    return try catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[[A: B]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[[A: B]]]? {
    return try catchNull(decodeArray(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [[A]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeArray(A.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A]]? {
    return try catchNull(decodeArray(decodeArray(A.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B]?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B]?]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C]?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C]?]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B?]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B?]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B?]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [[B]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [[B]]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [[B: C]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [[B: C]]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: [B]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C?]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C?]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: [C]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: [C]]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: [C: D]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: [C: D]]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [[A: [B: C]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: [B: C]]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [[A: B]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [[A: B]]? {
    return try catchNull(decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> [A]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeArray(A.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A]? {
    return try catchNull(decodeArray(A.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B?]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(catchNull(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B?]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(catchNull(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B]]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeArray(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B]]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeArray(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C]]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C]]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C?]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C?]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C]]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C]]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D]]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D]]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C]?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C]?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: B?]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: B?]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B]?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeArray(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B]?]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeArray(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C]?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C]?]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B?]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(catchNull(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B?]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(catchNull(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B?]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(catchNull(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[[B]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeArray(B.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[[B]]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeArray(B.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[[B: C]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[[B: C]]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [[B]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeArray(B.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C?]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C?]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: [C]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: [C]]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: [C: D]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: [C: D]]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [[B: C]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [[B: C]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(decodeDictionary(B.decode, elementDecodeClosure: C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: [B]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C]?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeArray(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C]?]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeArray(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D]?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeDictionary(C.decode, elementDecodeClosure: D.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D]?]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C?]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C?]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: catchNull(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C?]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(catchNull(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C?]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(catchNull(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [[C]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeArray(C.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [[C]]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeArray(C.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [[C: D]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeDictionary(C.decode, elementDecodeClosure: D.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [[C: D]]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(decodeDictionary(C.decode, elementDecodeClosure: D.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeArray(C.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D?]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: catchNull(D.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D?]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: catchNull(D.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: [D]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeArray(D.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: [D]]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeArray(D.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: [D: E]]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeDictionary(D.decode, elementDecodeClosure: E.decode))))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable, E: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: [D: E]]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: decodeDictionary(D.decode, elementDecodeClosure: E.decode)))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, key: String)throws-> [A: [B: [C: D]]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode)))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable, D: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: [C: D]]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: decodeDictionary(C.decode, elementDecodeClosure: D.decode))))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, key: String)throws-> [A: [B: C]]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode))) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable, C: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: [B: C]]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, key: String)throws-> [A: B]? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable, B: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> [A: B]? {
    return try catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode))(parseClosure(object))
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, key: String)throws-> A? {
    return try propagate(object, key) { try object |>? parse(key) |>  catchNull(A.decode) }
}

/**
 Retrieves the object at `path` from `json` and decodes it according to the return type

 - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
 - parameter path: A null-separated key-path string. Can be generated with `"keyA" => "keyB"`
*/
public func =>? <A: Decodable>(object: AnyObject, parseClosure: (AnyObject throws -> AnyObject))throws-> A? {
    return try catchNull(A.decode)(parseClosure(object))
}