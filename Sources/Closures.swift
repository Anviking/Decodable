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
    public static func decoder(_ elementDecodeClosure: (AnyObject) throws -> Element) -> (AnyObject) throws -> Array<Element> {
        return { json in
            return try NSArray.decode(json).map { try elementDecodeClosure($0) }
        }
    }
}

/// Create an array-decode-closure from an element decode closure
///
/// - returns: A closure that takes an `NSArray` and maps it using the element decode closure
public func array<T>(_ elementDecodeClosure: (AnyObject) throws -> T) -> (json: AnyObject) throws -> [T] {
    return { json in
        return try NSArray.decode(json).map { try elementDecodeClosure($0) }
    }
}

/// Create an dictionary-decode-closure from key- and value- decode closures
///
/// - returns: A closure that takes a `NSDictionary` and "maps" it using key and value decode closures 
public func dictionary<K,V>(key keyDecodeClosure: (AnyObject) throws -> K, value elementDecodeClosure: (AnyObject) throws -> V) -> (json: AnyObject) throws -> [K: V] {
    return { json in
        var dict = [K: V]()
        for (key, value) in try NSDictionary.decode(json) {
            try dict[keyDecodeClosure(key)] = elementDecodeClosure(value)
        }
        return dict
    }
}
