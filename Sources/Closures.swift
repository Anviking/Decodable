//
//  DecodeClosures.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-04.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

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

// MARK -

func catchNull<T>(_ decodeClosure: (AnyObject) throws -> T) -> (AnyObject) throws -> T? {
    return { json in
        if json is NSNull {
            return nil
        } else {
            return try decodeClosure(json)
        }
    }
}

func catchNull<T, Parameters>(_ decodeClosure: (DecodingContext<Parameters>) throws -> T) -> (DecodingContext<Parameters>) throws -> T? {
    return { context in
        if context.json is NSNull {
            return nil
        } else {
            return try decodeClosure(context)
        }
    }
}
