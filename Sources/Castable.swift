//
//  Castable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-09-25.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public func cast<T>(_ json: AnyObject) throws -> T {
    guard let result = json as? T else {
        let metadata = DecodingError.Metadata(object: json)
        throw DecodingError.typeMismatch(expected: T.self, actual: json.dynamicType, metadata)
    }
    return result
}

public protocol DynamicDecodable {
    associatedtype DecodedType
    static var decoder: (AnyObject) throws -> DecodedType {get set}
}

extension Decodable where Self: DynamicDecodable, Self.DecodedType == Self {
    public static func decode(_ json: AnyObject) throws -> Self {
        return try decoder(json)
    }
}

extension String: Decodable, DynamicDecodable {
    public static var decoder: (AnyObject) throws -> String = { try cast($0) }
}
extension Int: Decodable, DynamicDecodable {
    public static var decoder: (AnyObject) throws -> Int = { try cast($0) }
}
extension Double: Decodable, DynamicDecodable {
    public static var decoder: (AnyObject) throws -> Double = { try cast($0) }
}
extension Bool: Decodable, DynamicDecodable {
    public static var decoder: (AnyObject) throws -> Bool = { try cast($0) }
}

extension NSDictionary: Decodable {
    public static func decode(_ json: AnyObject) throws -> Self {
        return try cast(json)
    }
}

extension NSArray: DynamicDecodable {
    public static var decoder: (AnyObject) throws -> NSArray = { try cast($0) }
    public static func decode(_ json: AnyObject) throws -> NSArray {
        return try decoder(json)
    }

}
