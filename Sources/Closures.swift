//
//  Closure.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-10.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

/// Takes a decode closure and returns one that returns nil if the json object is `NSNull`


extension Optional {
    
    /// Create an array-decode-closure from an element decode closure
    ///
    /// - returns: A closure that takes an `NSArray` and maps it using the element decode closure
    static func decoder(_ decodeClosure: (AnyObject) throws -> Wrapped) -> (AnyObject) throws -> Wrapped? {
        return { json in
            if json is NSNull {
                return nil
            } else {
                return try decodeClosure(json)
            }
        }
    }
}

extension Array {
    
    /// Create an array-decode-closure from an element decode closure
    ///
    /// - returns: A closure that takes an `NSArray` and maps it using the element decode closure
    public static func decoder(_ elementDecodeClosure: (AnyObject) throws -> Element) -> (AnyObject) throws -> Array<Element> {
        return { json in
            return try NSArray.decode(json).map { try elementDecodeClosure($0) }
        }
    }
}

extension Dictionary {
    /// Create an dictionary-decode-closure from key- and value- decode closures
    ///
    /// - returns: A closure that takes a `NSDictionary` and "maps" it using key and value decode closures
    public static func decoder(key keyDecodeClosure: (AnyObject) throws -> Key, value elementDecodeClosure: (AnyObject) throws -> Value) -> (json: AnyObject) throws -> Dictionary {
        return { json in
            var dict = Dictionary()
            for (key, value) in try NSDictionary.decode(json) {
                try dict[keyDecodeClosure(key)] = elementDecodeClosure(value)
            }
            return dict
        }
    }
}

