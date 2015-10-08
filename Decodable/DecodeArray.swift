//
//  DecodeArray.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-10-04.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/// Designed to be used with parse(json, path, decodeClosure) as the decodeClosure. Thats why it's curried and a "top-level" function instead of a function in an array extension. For everyday use, prefer using [T].decode(json) instead (declared in Decodable.swift).
public func decodeArray<T>(elementDecodeClosure: AnyObject throws -> T)(json: AnyObject) throws -> [T] {
    
    guard let array = json as? [AnyObject] else {
        let info = DecodingError.Info(object: json)
        throw DecodingError.TypeMismatch(type: json.dynamicType, expectedType: [T].self, info: info)
    }
    
    var newArray = [T]()
    for obj in array {
        do {
            try newArray.append(elementDecodeClosure(obj))
        }
    }
    
    return newArray
}