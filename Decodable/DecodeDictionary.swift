//
//  DecodeDictionary.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-10-30.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/// Designed to be used with parse(json, path, decodeClosure) as the decodeClosure. Thats why it's curried. For everyday use, prefer using [K: V].decode(json) instead (declared in Decodable.swift).
public func decodeDictionary<K,V>(keyDecodeClosure: AnyObject throws -> K)(elementDecodeClosure: AnyObject throws -> V)(json: AnyObject) throws -> [K: V] {
    var dict = [K: V]()
    for (key, value) in try NSDictionary.decode(json) {
        try dict[keyDecodeClosure(key)] = elementDecodeClosure(value)
    }
    return dict
}