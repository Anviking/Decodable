//
//  NSValueCastable.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-01-06.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

extension Int64: NSNumberCastable {
    public static func convertFrom(_ n: NSNumber) -> Int64 { return n.int64Value }
}
extension Int32: NSNumberCastable {
    public static func convertFrom(_ n: NSNumber) -> Int32 { return n.int32Value }
}
extension Int16: NSNumberCastable {
    public static func convertFrom(_ n: NSNumber) -> Int16 { return n.int16Value }
}
extension Int8: NSNumberCastable {
    public static func convertFrom(_ n: NSNumber) -> Int8 { return n.int8Value }
}
extension UInt64: NSNumberCastable {
    public static func convertFrom(_ n: NSNumber) -> UInt64 { return n.uint64Value }
}
extension UInt32: NSNumberCastable {
    public static func convertFrom(_ n: NSNumber) -> UInt32 { return n.uint32Value }
}
extension UInt16: NSNumberCastable {
    public static func convertFrom(_ n: NSNumber) -> UInt16 { return n.uint16Value }
}
extension UInt8: NSNumberCastable {
    public static func convertFrom(_ n: NSNumber) -> UInt8 { return n.uint8Value }
}

/// Provides a default implementation of decode() which casts the object to a NSValue and unsafely casts its value as Self.
public protocol NSValueCastable: Decodable {}

/// Used to enable decoding to different IntegerTypes from NSNumber.
public protocol NSNumberCastable: NSValueCastable {
    static func convertFrom(_ n: NSNumber) -> Self
}

extension NSValueCastable {
    private typealias PointerOfSelf = UnsafeMutablePointer<Self> // Why do we have to do this?
    public static func decode(_ j: Any) throws -> Self {
        let value: NSValue = try cast(j)
        let pointer = PointerOfSelf.allocate(capacity: 1)
        defer { pointer.deallocate(capacity: 1) }
        value.getValue(pointer)
        return pointer.move()
    }
}

extension NSNumberCastable {
    public static func decode(_ json: Any) throws -> Self {
        return try convertFrom(cast(json))
    }
}
