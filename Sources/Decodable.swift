//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol Decodable {
    static func decode(_ json: AnyObject) throws -> Self
}


extension Dictionary where Key: Decodable, Value: Decodable {
    public static func decode(_ j: AnyObject) throws -> Dictionary {
        return try Dictionary.decoder(key: Key.decode, value: Value.decode)(j)
    }
}

extension Dictionary where Key: Decodable, Value: AnyObject {
    
    public static func decode(_ j: AnyObject) throws -> Dictionary {
        let valueDecoder: (AnyObject) throws -> Value = { try cast($0) }
        return try Dictionary.decoder(key: Key.decode, value: valueDecoder)(j)
    }
}

extension Array where Element: Decodable {
    public static func decode(_ j: AnyObject, ignoreInvalidObjects: Bool = false) throws -> [Element] {
        if ignoreInvalidObjects {
            return try [Element?].decoder { try? Element.decode($0) }(j).flatMap {$0}
        } else {
            return try Array.decoder(Element.decode)(j)
        }
    }
}

extension NSDictionary {
    public func decode<T: Decodable>(_ keyPath: String...) throws -> T {
        return try parse(self, keyPath: KeyPath(keyPath), decoder: T.decode)
    }
    
    public func decode<T: Decodable>(_ keyPath: OptionalKey...) throws -> T? {
        return try parse(self, keyPath: OptionalKeyPath(keys: keyPath), decoder: T.decode)
    }
}


// MARK: Helpers

/// Attempt to decode one of multiple objects in order until: A: we get a positive match, B: we throw an exception if the last object does not decode
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
