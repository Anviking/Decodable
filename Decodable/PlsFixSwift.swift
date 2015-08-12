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
    public var value: [T]
    
    public static func decode(json: AnyObject) throws -> DecodableArray<T> {
        guard let array = json as? [AnyObject] else {
            let info = DecodingError.Info(object: json)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        
        var newArray = [T]()
        for obj in array {
            print(obj)
            try newArray.append(T.decode(obj))
        }
        
        return DecodableArray(value: newArray)
    }
}

public struct NilFilteringArray<T: Decodable>: Decodable {
    var value: [T]
    
    public static func decode(json: AnyObject) throws -> NilFilteringArray<T> {
        guard let array = json as? [AnyObject] else {
            let info = DecodingError.Info(object: json)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        
        var newArray = [T]()
        for obj in array {
            print(obj)
            do {
                try newArray.append(T.decode(obj))
            } catch let error {
                print("NilFilteringArray caught an error: \(error)")
            }
        }
        
        return NilFilteringArray(value: newArray)
    }
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]
{
    return try ((lhs => rhs) as DecodableArray<T>).value
}


public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]
{
    return try ((lhs => rhs) as NilFilteringArray<T>).value
}

public func => <T: Decodable>(lhs: AnyObject, rhs: ((AnyObject) throws -> DecodableArray<T>)) throws -> [T]
{
    return try (rhs(lhs) as DecodableArray<T>).value
}

public func =>? <T: Decodable>(lhs: AnyObject, rhs: ((AnyObject) throws -> NilFilteringArray<T>)) throws -> [T]
{
    return try (rhs(lhs) as NilFilteringArray<T>).value
}

// Optionals 

public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> [T]? {
    do {
        return try ((lhs => rhs) as DecodableArray<T>).value
    } catch {
        return nil
    }
}

public func => <T: Decodable>(lhs: AnyObject, rhs: ((AnyObject) throws -> DecodableArray<T>)) -> [T]?
{
    do {
        return try (rhs(lhs) as DecodableArray<T>).value
    } catch {
        return nil
    }
}
