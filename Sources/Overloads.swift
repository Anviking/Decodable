//
//  Overloads.swift
//  Decodable
//
//  Generated automatically by Generator.swift as a build phase.
//  Copyright © 2016 anviking. All rights reserved.
//

// 42 overloads were generated with the following return types:
// [A]?, [A: B]?, A?, [A?], [[A]], [[A: B]], [A], [A: B?], [A: [B]], [A: [B: C]], [A: B], A

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError` if a key is missing or decoding fails.
/// - returns: `nil` if the object at `path` is `NSNull`
///
public func => <A: Decodable>(json: JSON, keyPath: KeyPath) throws -> [A]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(A.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError` if a key is missing or decoding fails.
/// - returns: `nil` if the object at `path` is `NSNull`
///
public func => <A: Decodable>(json: Any, keyPath: KeyPath) throws -> [A]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(A.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError` if a key is missing or decoding fails.
/// - returns: `nil` if the object at `path` is `NSNull`
///
public func => <A: Decodable, B: Decodable>(json: JSON, keyPath: KeyPath) throws -> [A: B]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: B.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError` if a key is missing or decoding fails.
/// - returns: `nil` if the object at `path` is `NSNull`
///
public func => <A: Decodable, B: Decodable>(json: Any, keyPath: KeyPath) throws -> [A: B]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: B.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError` if a key is missing or decoding fails.
/// - returns: `nil` if the object at `path` is `NSNull`
///
public func => <A: Decodable>(json: JSON, keyPath: KeyPath) throws -> A? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(A.decode))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError` if a key is missing or decoding fails.
/// - returns: `nil` if the object at `path` is `NSNull`
///
public func => <A: Decodable>(json: Any, keyPath: KeyPath) throws -> A? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(A.decode))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable>(json: JSON, keyPath: KeyPath) throws -> [A?] {
    return try json.parse(keyPath: keyPath, decoder: Array.decoder(Optional.decoder(A.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable>(json: Any, keyPath: KeyPath) throws -> [A?] {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Array.decoder(Optional.decoder(A.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable>(json: JSON, keyPath: KeyPath) throws -> [[A]] {
    return try json.parse(keyPath: keyPath, decoder: Array.decoder(Array.decoder(A.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable>(json: Any, keyPath: KeyPath) throws -> [[A]] {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Array.decoder(Array.decoder(A.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable>(json: JSON, keyPath: KeyPath) throws -> [[A: B]] {
    return try json.parse(keyPath: keyPath, decoder: Array.decoder(Dictionary.decoder(key: A.decode, value: B.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable>(json: Any, keyPath: KeyPath) throws -> [[A: B]] {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Array.decoder(Dictionary.decoder(key: A.decode, value: B.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable>(json: JSON, keyPath: KeyPath) throws -> [A] {
    return try json.parse(keyPath: keyPath, decoder: Array.decoder(A.decode))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable>(json: Any, keyPath: KeyPath) throws -> [A] {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Array.decoder(A.decode))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable>(json: JSON, keyPath: KeyPath) throws -> [A: B?] {
    return try json.parse(keyPath: keyPath, decoder: Dictionary.decoder(key: A.decode, value: Optional.decoder(B.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable>(json: Any, keyPath: KeyPath) throws -> [A: B?] {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Dictionary.decoder(key: A.decode, value: Optional.decoder(B.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable>(json: JSON, keyPath: KeyPath) throws -> [A: [B]] {
    return try json.parse(keyPath: keyPath, decoder: Dictionary.decoder(key: A.decode, value: Array.decoder(B.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable>(json: Any, keyPath: KeyPath) throws -> [A: [B]] {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Dictionary.decoder(key: A.decode, value: Array.decoder(B.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable, C: Decodable>(json: JSON, keyPath: KeyPath) throws -> [A: [B: C]] {
    return try json.parse(keyPath: keyPath, decoder: Dictionary.decoder(key: A.decode, value: Dictionary.decoder(key: B.decode, value: C.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable, C: Decodable>(json: Any, keyPath: KeyPath) throws -> [A: [B: C]] {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Dictionary.decoder(key: A.decode, value: Dictionary.decoder(key: B.decode, value: C.decode)))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable>(json: JSON, keyPath: KeyPath) throws -> [A: B] {
    return try json.parse(keyPath: keyPath, decoder: Dictionary.decoder(key: A.decode, value: B.decode))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable, B: Decodable>(json: Any, keyPath: KeyPath) throws -> [A: B] {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Dictionary.decoder(key: A.decode, value: B.decode))
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable>(json: JSON, keyPath: KeyPath) throws -> A {
    return try json.parse(keyPath: keyPath, decoder: A.decode)
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: something
///
public func => <A: Decodable>(json: Any, keyPath: KeyPath) throws -> A {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: A.decode)
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> [A?]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(Optional.decoder(A.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> [A?]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(Optional.decoder(A.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> [[A]]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(Array.decoder(A.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> [[A]]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(Array.decoder(A.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> [[A: B]]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(Dictionary.decoder(key: A.decode, value: B.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> [[A: B]]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(Dictionary.decoder(key: A.decode, value: B.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> [A]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(A.decode))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> [A]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Array.decoder(A.decode))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> [A: B?]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: Optional.decoder(B.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> [A: B?]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: Optional.decoder(B.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> [A: [B]]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: Array.decoder(B.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> [A: [B]]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: Array.decoder(B.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> [A: [B: C]]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: Dictionary.decoder(key: B.decode, value: C.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> [A: [B: C]]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: Dictionary.decoder(key: B.decode, value: C.decode)))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> [A: B]? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: B.decode))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable, B: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> [A: B]? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(Dictionary.decoder(key: A.decode, value: B.decode))).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> A? {
    return try json.parse(keyPath: keyPath, decoder: Optional.decoder(A.decode)).flatMap{$0}
}

/// Retrieves the object at `path` from `json` and decodes it according to the return type
/// 
/// - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.
/// - parameter path: `KeyPath`– can be appended using with `=>` or `=>?`
/// - throws: `DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys
/// - returns: `nil` if the object at `path` is `NSNull` or if any optional key is missing.
///
public func =>? <A: Decodable>(json: Any, keyPath: OptionalKeyPath) throws -> A? {
    return try JSON(value: json).parse(keyPath: keyPath, decoder: Optional.decoder(A.decode)).flatMap{$0}
}