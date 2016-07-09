//
//  FoundationExtensions.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-04.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

extension NSDictionary {
    public static func decode(_ j: AnyObject) throws -> NSDictionary {
        guard let result = j as? NSDictionary else {
            let metadata = DecodingError.Metadata(object: j)
            throw DecodingError.typeMismatch(expected: self, actual: j.dynamicType, metadata)
        }
        return result
    }
}

extension NSArray {
    public static func decode(_ json: AnyObject) throws -> NSArray {
        
        guard let result = json as? NSArray else {
            let metadata = DecodingError.Metadata(object: json)
            throw DecodingError.typeMismatch(expected: self, actual: json.dynamicType, metadata)
        }
        return result
    }
    
    public static func decode<T>(_ context: DecodingContext<T>) throws -> NSArray {
        
        guard let result = context.json as? NSArray else {
            throw context.typeMismatch(expectedType: self)
        }
        return result
    }
}

extension Dictionary where Key: Decodable, Value: Decodable, Key.Parameters == Void {
    public static func decode(_ context: DecodingContext<Value.Parameters>) throws -> Dictionary {
        let key = Key.decodeClosure(parameters: ())
        let value = Value.decodeClosure(parameters: context.parameters)
        return try decodeDictionary(key, elementDecodeClosure: value)(json: context.json)
    }
}

extension Array where Element: Decodable {
    public static func decode(_ context: DecodingContext<Element.Parameters>, ignoreInvalidObjects: Bool = false) throws -> [Element] {
        if ignoreInvalidObjects {
            return try decodeArray { try? Element.decode($0) }(context).flatMap {$0}
        } else {
            return try decodeArray(Element.decode)(context)
        }
    }
}
