//
//  NSValueCastable.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-01-06.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

extension Int64: NSNumberCastable {
    public static func convertFrom(n: NSNumber) -> Int64 { return Int64(n.intValue) }
}
extension Int32: NSNumberCastable {
    public static func convertFrom(n: NSNumber) -> Int32 { return n.intValue }
}
extension Int16: NSNumberCastable {
    public static func convertFrom(n: NSNumber) -> Int16 { return Int16(n.intValue) }
}
extension Int8: NSNumberCastable {
    public static func convertFrom(n: NSNumber) -> Int8 { return Int8(n.intValue) }
}
extension UInt64: NSNumberCastable {
    public static func convertFrom(n: NSNumber) -> UInt64 { return UInt64(n.unsignedIntegerValue) }
}
extension UInt32: NSNumberCastable {
    public static func convertFrom(n: NSNumber) -> UInt32 { return n.unsignedIntValue }
}
extension UInt16: NSNumberCastable {
    public static func convertFrom(n: NSNumber) -> UInt16 { return UInt16(n.unsignedIntegerValue) }
}
extension UInt8: NSNumberCastable {
    public static func convertFrom(n: NSNumber) -> UInt8 { return UInt8(n.unsignedIntegerValue) }
}

/// Provides a default implementation of decode() which casts the object to a NSValue and unsafely casts its value as Self.
public protocol NSValueCastable: Decodable {}

/// Used to enable decoding to different IntegerTypes from NSNumber.
public protocol NSNumberCastable: NSValueCastable {
    static func convertFrom(n: NSNumber) -> Self
}

extension NSValueCastable {
    private typealias PointerOfSelf = UnsafeMutablePointer<Self> // Why do we have to do this?
    public static func decode(j: AnyObject) throws -> Self {
        guard let value = j as? NSValue else {
            throw TypeMismatchError(expectedType: NSValue.self, receivedType: j.dynamicType, object: j)
        }

        let pointer = PointerOfSelf.alloc(1)
        defer { pointer.dealloc(1) }
        value.getValue(pointer)
        return pointer.move()
    }
}

extension NSNumberCastable {
    public static func decode(j: AnyObject) throws -> Self {
        guard let value = j as? NSNumber else {
            throw TypeMismatchError(expectedType: NSNumber.self, receivedType: j.dynamicType, object: j)
        }
        return convertFrom(value)
    }
}
