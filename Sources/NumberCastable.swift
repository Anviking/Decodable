//
//  NumberCastable.swift
//  Decodable
//
//  Created by Brian King on 1/5/16.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

// It's unfortunate that these types don't support downcasting from NSNumber,
// so downcast to NSNumber and then extract the typed value.
public protocol NumberCastable: Decodable {
    static func fromNumber(number: NSNumber) -> Self
}

extension NumberCastable {
    public static func decode(j: AnyObject) throws -> Self {
        guard let result = j as? NSNumber else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: j.dynamicType, expectedType: self, info: info)

        }
        return Self.fromNumber(result)
    }
}

extension Int16: NumberCastable {
    public static func fromNumber(number: NSNumber) -> Int16 {
        return number.shortValue
    }
}

extension Int32: NumberCastable {
    public static func fromNumber(number: NSNumber) -> Int32 {
        return number.intValue
    }
}

extension Int64: NumberCastable {
    public static func fromNumber(number: NSNumber) -> Int64 {
        return number.longLongValue
    }
}

extension UInt16: NumberCastable {
    public static func fromNumber(number: NSNumber) -> UInt16 {
        return number.unsignedShortValue
    }
}

extension UInt32: NumberCastable {
    public static func fromNumber(number: NSNumber) -> UInt32 {
        return number.unsignedIntValue
    }
}

extension UInt64: NumberCastable {
    public static func fromNumber(number: NSNumber) -> UInt64 {
        return number.unsignedLongLongValue
    }
}
