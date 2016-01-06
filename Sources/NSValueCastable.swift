//
//  NSValueCastable.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-01-06.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

extension Int32: NSValueCastable {}
extension Int64: NSValueCastable {}
extension Int16: NSValueCastable {}
extension Int8: NSValueCastable {}
extension UInt32: NSValueCastable {}
extension UInt64: NSValueCastable {}
extension UInt16: NSValueCastable {}
extension UInt8: NSValueCastable {}

public protocol NSValueCastable {}
extension NSValueCastable {
    private typealias PointerOfSelf = UnsafeMutablePointer<Self> // Why do we have to do this?
    public static func decode(j: AnyObject) throws -> Self {
        guard let value = j as? NSValue else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: j.dynamicType, expectedType: NSValue.self, info: info)
        }
        
        let pointer = PointerOfSelf.alloc(1)
        value.getValue(pointer)
        return pointer.memory
    }
}
