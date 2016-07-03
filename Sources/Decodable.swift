//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public struct DecodingContext<T> {
    var path: [String]
    var json: AnyObject
    var rootObject: AnyObject
    var parameters: T
    
    init(json: AnyObject, path: [String] = [], rootObject: AnyObject, parameters: T) {
        self.json = json
        self.path = path
        self.rootObject = rootObject
        self.parameters = parameters
    }

    public func parse(key: String) throws -> DecodingContext {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            throw MissingKeyError(key: key, object: json)
        }
        
        var new = self
        new.json = obj
        return new
    }
    
    public func parse(keys: [String]) throws -> DecodingContext {
        return try keys.reduce(self) { try $0.0.parse(key: $0.1) }
    }
    
    public func parseAndAcceptMissingKey(key: String) throws -> DecodingContext? {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            throw MissingKeyError(key: key, object: json)
        }
        
        return with(json: obj)
    }
    
    public func parseAndAcceptMissingKeys(keys: [String]) throws -> DecodingContext? {
        return try keys.reduce(self) { try $0.0?.parseAndAcceptMissingKey(key: $0.1) }
    }
    
    public func with(json: AnyObject) -> DecodingContext {
        var new = self
        new.json = json
        return new
    }
    
    func map<U>(closure: (T) -> U) -> DecodingContext<U> {
        return DecodingContext<U>(json: json, path: path, rootObject: rootObject, parameters: closure(parameters))
    }
}

public protocol Decodable {
    associatedtype Parameters = Void
    static func decode(_ : DecodingContext<Parameters>) throws -> Self
    //static func decode(_ json: AnyObject) throws -> Self
}



extension Decodable where Parameters == Void {
    
    /// Convenience overload for decode(_:DecodingContext<Void>)
    ///
    /// - parameter json: JSON object from `NSJSONSerialization`.
    public static func decode(_ json: AnyObject) throws -> Self {
        return try Self.decode(json)
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



public func decodeDictionary<K,V, A, B>(_ keyDecodeClosure: (DecodingContext<A>) throws -> K, elementDecodeClosure: (DecodingContext<B>) throws -> V) -> (DecodingContext<(A,B)>) throws -> [K: V] {
    return { context in
        var dict = [K: V]()
        for (key, value) in try NSDictionary.decode(context.json) {
            let keyContext = context.map { $0.0 }
            let valueContext = context.map { $0.1 }
            
            try dict[keyDecodeClosure(keyContext.with(json: key))] = elementDecodeClosure(valueContext.with(json: value))
        }
        return dict
    }
}
