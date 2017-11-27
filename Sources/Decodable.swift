//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol Decodable {
    static func decode(_ json: JSON) throws -> Self
}

extension Dictionary: Decodable where Key: Decodable, Value: Decodable {
    public static func decode(_ j: JSON) throws -> Dictionary {
        return try Dictionary.decoder(key: Key.decode, value: Value.decode)(j)
    }
}

extension Array: Decodable where Element: Decodable {
    public static func decode(_ j: JSON) throws -> Array {
        return try Array.decoder(Element.decode)(j)
    }
}

extension Optional: Decodable where Wrapped: Decodable {
    public static func decode(_ j: JSON) throws -> Optional {
        return try Optional.decoder(Wrapped.decode)(j)
    }
}

extension Array where Element: Decodable {
    public static func decode(_ j: JSON, ignoreInvalidObjects: Bool = false) throws -> [Element] {
        if ignoreInvalidObjects {
            return try [Element?].decoder { try? Element.decode($0) }(j).flatMap {$0}
        } else {
            return try Array.decoder(Element.decode)(j)
        }
    }
}
