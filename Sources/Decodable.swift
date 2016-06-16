//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol DecodingContext {
    var path: [String] {get set}
    var json: AnyObject {get set}
    var rootObject: AnyObject {get}
    
    func parse(key: String) throws -> Self
    func parse(keys: [String]) throws -> Self
    func parseAndAcceptMissingKeys(keys: [String]) throws -> Self?
    func parseAndAcceptMissingKey(key: String) throws -> Self?
    
    func with(json: AnyObject) -> Self
}

extension DecodingContext {
    public func parse(key: String) throws -> Self {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            throw MissingKeyError(key: key, object: json)
        }
        
        var new = self
        new.json = obj
        return new
    }
    
    public func parse(keys: [String]) throws -> Self {
        return try keys.reduce(self) { try $0.0.parse(key: $0.1) }
    }
    
    public func parseAndAcceptMissingKey(key: String) throws -> Self? {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            throw MissingKeyError(key: key, object: json)
        }
        
        return with(json: obj)
    }
    
    public func parseAndAcceptMissingKeys(keys: [String]) throws -> Self? {
        return try keys.reduce(self) { try $0.0?.parseAndAcceptMissingKey(key: $0.1) }
    }
    
    public func with(json: AnyObject) -> Self {
        var new = self
        new.json = json
        return new
    }

}

public struct DefaultContext: DecodingContext {
    public var path: [String]
    public var rootObject: AnyObject
    public var json: AnyObject
}


public protocol Decodable {
    associatedtype Context: DecodingContext = DefaultContext
    static func decode(_ : Context) throws -> Self
    //static func decode(_ json: AnyObject) throws -> Self
}



extension Decodable where Context == DefaultContext {
    /*public static func decode(_ context: Context) throws -> Self {
        return try Self.decode(context.json)
    }
     */
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
    public static func decode<C: DecodingContext>(_ context: C) throws -> NSArray {
        guard let result = context.json as? NSArray else {
            throw TypeMismatchError(expectedType: self, receivedType: context.json.dynamicType, object: context.json)
        }
        return result
    }
}

extension Dictionary where Key: Decodable, Value: Decodable {
    public static func decode(_ j: AnyObject) throws -> Dictionary {
        return try decodeDictionary(Key.decode, elementDecodeClosure: Value.decode)(j)
    }
}

extension Array where Element: Decodable {
    public static func decode(_ j: AnyObject, ignoreInvalidObjects: Bool = false) throws -> [Element] {
        if ignoreInvalidObjects {
            return try decodeArray { try? Element.decode($0) }(j).flatMap {$0}
        } else {
            return try decodeArray(Element.decode)(j)
        }
    }
}


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
public func decodeArray<T: Decodable>(_ elementDecodeClosure: (T.Context) throws -> T) -> (T.Context) throws -> [T] {
    return { context in
        return try NSArray.decode(context).map {
            var c = context
            c.json = $0
            return try elementDecodeClosure(c)
        }
    }
}

/// Designed to be used with parse(json, path, decodeClosure) as the decodeClosure. Thats why it's curried. For everyday use, prefer using [K: V].decode(json) instead (declared in Decodable.swift).
public func decodeDictionary<K,V,Context: DecodingContext>(_ keyDecodeClosure: (Context) throws -> K, elementDecodeClosure: (Context) throws -> V) -> (Context) throws -> [K: V] {
    return { context in
        var dict = [K: V]()
        for (key, value) in try NSDictionary.decode(context.json) {
            try dict[keyDecodeClosure(context.with(json: key))] = elementDecodeClosure(context.with(json: value))
        }
        return dict
    }
}
