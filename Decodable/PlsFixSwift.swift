//
//  PlsFixSwift.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-17.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

// Since we cannot to "extension Array: Decodable where ..."

public struct DecodableArray<T: Decodable>: Decodable {
    var value: [T]
    
    public static func decode(json: AnyObject) throws -> DecodableArray<T> {
        guard let array = json as? [AnyObject] else {
            throw DecodingError.TypeMismatch(path: [], type: self, object: json)
        }
        
        var newArray = [T]()
        for obj in array {
            print(obj)
            try newArray.append(T.decode(obj))
        }
        
        return DecodableArray(value: newArray)
    }
}


public func => <T: Decodable>(lhs: AnyObject, rhs: ((AnyObject) throws -> DecodableArray<T>)) throws -> [T]
{
    return try ((lhs => rhs) as DecodableArray<T>).value
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]
{
    return try ((lhs => rhs) as DecodableArray<T>).value
}