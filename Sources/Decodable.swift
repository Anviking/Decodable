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
        let context = DecodingContext(json: json, parameters: ())
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


