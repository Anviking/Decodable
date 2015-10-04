//
//  DecodeArray.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-10-04.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

// Note: Favor use of [T].decode(json) declared in Decodable.swift

public func decodeArray<T: Decodable>(ignoreInvalidObjects ignoreInvalidObjects: Bool = false)(json: AnyObject) throws -> [T] {
    
    guard let array = json as? [AnyObject] else {
        let info = DecodingError.Info(object: json)
        throw DecodingError.TypeMismatch(type: json.dynamicType, expectedType: [T].self, info: info)
    }
    
    var newArray = [T]()
    for obj in array {
        do {
            try newArray.append(T.decode(obj))
        } catch let error {
            if ignoreInvalidObjects {
                print("Error decoding array of \(T.self): \(error)")
                print(obj)
            } else {
                throw error
            }
        }
    }
    
    return newArray
}

public func decodeArray<T: Decodable>(json: AnyObject) throws -> [T?] {
    
    guard let array = json as? [AnyObject] else {
        let info = DecodingError.Info(object: json)
        throw DecodingError.TypeMismatch(type: json.dynamicType, expectedType: [T].self, info: info)
    }
    
    var newArray = [T?]()
    for obj in array {
        do {
            try newArray.append(T.decode(obj))
        } catch {
            print("Error decoding array of \(T.self): \(error)")
            newArray.append(nil)
        }
    }
    
    return newArray
}