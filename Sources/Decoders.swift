//
//  Closure.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-10.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

extension Optional {
    
    /// Creates an optional decoder from a decoder of the Wrapped type
    ///
    /// This function is used by `=>` and `=>?` overloads when decoding `T?`
    ///
    /// - parameter wrappedDecoder: A decoder (decode closure) for the wrapped type
    /// - returns: A closure takes an JSON object, checks it's `NSNull`, if so returns `nil`, otherwise calls the wrapped decode closure.
    static func decoder(_ wrappedDecoder: @escaping (JSON) throws -> Wrapped) -> (JSON) throws -> Wrapped? {
        return { json in
            if json.json is NSNull {
                return nil
            } else {
                return try wrappedDecoder(json)
            }
        }
    }
}

extension Array {
    
    /// Creates an array decoder from an element decoder
    ///
    /// This function is used by `=>` and `=>?` overloads when decoding `[T]`
    ///
    /// - parameter elementDecoder: A decoder (decode closure) for the `Element` type
    /// - throws: if `NSArray.decode` throws or any element decode closure throws
    /// - returns: A closure that takes an `NSArray` and maps it using the element decode closure
    public static func decoder(_ elementDecoder: @escaping (JSON) throws -> Element) -> (JSON) throws -> Array<Element> {
        return { json in
            return try NSArray.decode(json).map { try elementDecoder(json.with(json: $0)) }
        }
    }
}

extension Dictionary {
    /// Create a dictionary decoder from key- and value- decoders
    ///
    /// This function is used by `=>` and `=>?` overloads when decoding `[K: V]`
    ///
    /// - parameter key: A decoder (decode closure) for the `Key` type
    /// - parameter value: A decoder (decode closure) for the `Value` type
    /// - returns: A closure that takes a `NSDictionary` and "maps" it using key and value decode closures
    public static func decoder(key keyDecoder: @escaping (JSON) throws -> Key, value valueDecoder: @escaping (JSON) throws -> Value) -> (JSON) throws -> Dictionary {
        return { json in
            var dict = Dictionary()
            for (key, value) in try NSDictionary.decode(json) {
                try dict[keyDecoder(json.with(json: key))] = valueDecoder(json.with(json: value))
            }
            return dict
        }
    }
}

