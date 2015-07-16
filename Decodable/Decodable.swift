//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol Decodable {
    static func decode(json: AnyObject) throws -> Self
}

extension String: Decodable {
    public static func decode(j: AnyObject) throws -> String {
        guard let result = j as? String else {
            throw DecodingError.TypeMismatch(path: [], type: self, object: j)
        }
        return result
    }
}

extension Int: Decodable {
    public static func decode(j: AnyObject) throws -> Int {
        guard let result = j as? Int else {
            throw DecodingError.TypeMismatch(path: [], type: self, object: j)
        }
        return result
    }
}

extension Double: Decodable {
    public static func decode(j: AnyObject) throws -> Double {
        guard let result = j as? Double else {
            throw DecodingError.TypeMismatch(path: [], type: self, object: j)
        }
        return result
    }
}

// Only casts, see DecodableDictionary for decoding
extension Dictionary: Decodable {
    public static func decode(json: AnyObject) throws -> Dictionary {
        guard let result = json as? [Key: Value] else {
            throw DecodingError.TypeMismatch(path: [], type: self, object: json)
        }
        
        return result
    }
}

// Only casts, see DecodableArray for decoding
extension Array: Decodable {
    public static func decode(json: AnyObject) throws -> Array {
        guard let result = json as? [Element] else {
            throw DecodingError.TypeMismatch(path: [], type: self, object: json)
        }
        
        return result
    }
}