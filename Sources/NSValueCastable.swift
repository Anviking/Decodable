//
//  NSValueCastable.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-01-06.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

extension Int64: NSValueCastable {}
extension Int32: NSValueCastable {}
extension Int16: NSValueCastable {}
extension Int8: NSValueCastable {}
extension UInt64: NSValueCastable {}
extension UInt32: NSValueCastable {}
extension UInt16: NSValueCastable {}
extension UInt8: NSValueCastable {}

/// Provides a default implementation of decode() which casts the object to a NSValue and unsafely casts its value as Self. Used to enable decoding to different IntegerTypes from NSNumber.
public protocol NSValueCastable: Decodable {}

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
