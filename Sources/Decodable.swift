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
    public static func decode(_ j: AnyObject) throws -> NSArray {
        guard let result = j as? NSArray else {
            let metadata = DecodingError.Metadata(object: j)
            throw DecodingError.typeMismatch(expected: self, actual: j.dynamicType, metadata)
        }
        return result
    }
}

extension Dictionary where Key: Decodable, Value: Decodable {
    public static func decode(_ j: AnyObject) throws -> Dictionary {
        return try decoder(key: Key.decode, value: Value.decode)(json: j)
    }
}

extension Dictionary where Key: Decodable, Value: AnyObject {
    
    public static func decode(_ j: AnyObject) throws -> Dictionary {
        let valueDecoder: (AnyObject) throws -> Value = { json in
            guard let a = json as? Value else {
                let metadata = DecodingError.Metadata(object: json)
                throw DecodingError.typeMismatch(expected: Value.self, actual: json.dynamicType, metadata)
            }
            return a
        }
        return try decoder(key: Key.decode, value: valueDecoder)(json: j)
    }
}

extension Array where Element: Decodable {
    public static func decode(_ j: AnyObject, ignoreInvalidObjects: Bool = false) throws -> [Element] {
        if ignoreInvalidObjects {
            return try [Element?].decoder { try? Element.decode($0) }(j).flatMap {$0}
        } else {
            return try decoder(Element.decode)(j)
        }
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
