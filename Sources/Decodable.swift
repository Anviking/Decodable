//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol Decodable {
    associatedtype Parameters = Void
    static func decode(_ context :DecodingContext<Parameters>) throws -> Self
}


extension Decodable where Parameters == Void {
    
    /// Convenience overload for decode(_:DecodingContext<Void>)
    ///
    /// - parameter json: JSON object from `NSJSONSerialization`.
    public static func decode(_ json: AnyObject) throws -> Self {
        let context = DecodingContext(json: json, path: [], rootObject: json, parameters: ())
        return try Self.decode(context)
    }
}

extension Decodable {
    
    /// Convenience overload for decode(_:DecodingContext<Void>)
    ///
    /// - parameter json: JSON object from `NSJSONSerialization`.
    public static func decode(_ json: AnyObject, parameters: Parameters) throws -> Self {
        let context = DecodingContext(json: json, path: [], rootObject: json, parameters: parameters)
        return try Self.decode(context)
    }
}

extension Decodable {
    internal static func decodeClosure(parameters: Self.Parameters) -> (AnyObject) throws -> Self {
        return { json in
            return try Self.decode(json, parameters: parameters)
        }
    }
}

extension NSDictionary {
    public static func decode(_ j: AnyObject) throws -> NSDictionary {
        guard let result = j as? NSDictionary else {
            throw TypeMismatchError(expectedType: self, receivedType: j.dynamicType, object: j)
        }
        return result
    }
}

extension NSArray {
    public static func decode(_ json: AnyObject) throws -> NSArray {
        
        guard let result = json as? NSArray else {
            throw TypeMismatchError(expectedType: self, receivedType: json.dynamicType, object: json)
        }
        return result
    }
    
    public static func decode<T>(_ context: DecodingContext<T>) throws -> NSArray {
        
        guard let result = context.json as? NSArray else {
            throw TypeMismatchError(expectedType: self, receivedType: context.json.dynamicType, object: context.json)
        }
        return result
    }
}

/*
extension Dictionary where Key: Decodable, Value: Decodable {
    public static func decode(_ j: AnyObject) throws -> Dictionary {
        return try decodeDictionary(Key.decode, elementDecodeClosure: Value.decode)(j)
    }
}
 */

/*
extension Array where Element: Decodable {
    public static func decode(_ j: AnyObject, ignoreInvalidObjects: Bool = false) throws -> [Element] {
        if ignoreInvalidObjects {
            return try decodeArray { try? Element.decode($0) }(j).flatMap {$0}
        } else {
            return try decodeArray(Element.decode)(j)
        }
    }
}
*/


// MARK: Helpers

/// Attempt to decode one of multiple objects in order until: A: we get a positive match, B: we throw an exception if the last object does not decode
/*
 public func decodeAsOneOf(_ json: AnyObject, objectTypes: Decodable.Type...) throws -> Decodable {
	for decodable in objectTypes.dropLast() {
 if let decoded = try? decodable.decode(json) {
 return decoded
 }
	}
	return try objectTypes.last!.decode(json)
 }
 
 /// Attempt to decode one of multiple objects in order until: A: we get a positive match, B: we throw an exception if the last object does not decode
 public func decodeArrayAsOneOf(_ json: AnyObject, objectTypes: Decodable.Type...) throws -> [Decodable] {
	return try NSArray.decode(json).map {
 for decodable in objectTypes.dropLast() {
 if let decoded = try? decodable.decode($0) {
 return decoded
 }
 }
 return try objectTypes.last!.decode($0)
	}
 }
 */
/// Designed to be used with parse(json, path, decodeClosure) as the decodeClosure. Thats why it's curried and a "top-level" function instead of a function in an array extension. For everyday use, prefer using [T].decode(json) instead.
public func decodeArray<T>(_ elementDecodeClosure: (AnyObject) throws -> T) -> (AnyObject) throws -> [T] {
    return { json in
        return try NSArray.decode(json).map {
            return try elementDecodeClosure($0)
        }
    }
}


public func decodeArray<T, Parameters>(_ elementDecodeClosure: (DecodingContext<Parameters>) throws -> T) -> (DecodingContext<Parameters>) throws -> [T] {
    return { context in
        return try NSArray.decode(context).map {
            var c = context
            c.json = $0
            return try elementDecodeClosure(c)
        }
    }
}

/// Designed to be used with parse(json, path, decodeClosure) as the decodeClosure. Thats why it's curried. For everyday use, prefer using [K: V].decode(json) instead (declared in Decodable.swift).
public func decodeDictionary<K,V>(_ keyDecodeClosure: (AnyObject) throws -> K, elementDecodeClosure: (AnyObject) throws -> V) -> (json: AnyObject) throws -> [K: V] {
    return { json in
        var dict = [K: V]()
        for (key, value) in try NSDictionary.decode(json) {
            try dict[keyDecodeClosure(key)] = elementDecodeClosure(value)
        }
        return dict
    }
}

