//
//  Castable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-09-25.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/// Attempt to cast an `Any` to `T` or throw
///
/// - throws: `DecodingError.typeMismatch(expected, actual, metadata)`
public func cast<T>(_ object: Any) throws -> T {
    guard let result = object as? T else {
        let metadata = DecodingError.Metadata(object: object)
        throw DecodingError.typeMismatch(expected: T.self, actual: type(of: object), metadata)
    }
    return result
}

/// Allows overriding default `decode` function from your app.
/// 
/// You likely don't want to conform to this yourself.
public protocol DynamicDecodable {
    associatedtype DecodedType
    
    /// A closure describing how this type should be decoded
    /// 
    /// Types also conforming to `Decodable` call this closure 
    /// from their `decode` function.
    ///
    /// - note: This is intended as a set-once thing.
    static var decoder: (Any) throws -> DecodedType {get set}
}

extension Decodable where Self: DynamicDecodable, Self.DecodedType == Self {
    public static func decode(_ json: Any) throws -> Self {
        return try decoder(json)
        
    }
}

extension String: Decodable, DynamicDecodable {
    public static var decoder: (Any) throws -> String = { try cast($0) }
}
extension Int: Decodable, DynamicDecodable {
    public static var decoder: (Any) throws -> Int = { try cast($0) }
}
extension Double: Decodable, DynamicDecodable {
    public static var decoder: (Any) throws -> Double = { try cast($0) }
}
extension Bool: Decodable, DynamicDecodable {
    public static var decoder: (Any) throws -> Bool = { try cast($0) }
}

private let iso8601DateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    return formatter
}()

extension Date: Decodable, DynamicDecodable {
    /// Default decoder is `Date.decoder(using: iso8601DateFormatter)`
    public static var decoder: (Any) throws -> Date = Date.decoder(using: iso8601DateFormatter)
    
    /// Create a decode closure using a given formatter
    ///
    /// Example usage:
    /// ```
    /// let formatter = DateFormatter(...)
    /// Date.decoder = Date.decoder(using: formatter)
    /// ```
    public static func decoder(using formatter: DateFormatter) -> (Any) throws -> Date {
        return { object in
            let string = try String.decode(object)
            guard let date = formatter.date(from: string) else {
                let metadata = DecodingError.Metadata(object: object)
                throw DecodingError.rawRepresentableInitializationError(rawValue: string, metadata)
            }
            return date
        }
    }
    
}

extension NSDictionary: Decodable {
    public static func decode(_ json: Any) throws -> Self {
        return try cast(json)
    }
}

extension NSArray: DynamicDecodable {
    public static var decoder: (Any) throws -> NSArray = { try cast($0) }
    public static func decode(_ json: Any) throws -> NSArray {
        return try decoder(json)
    }

}
