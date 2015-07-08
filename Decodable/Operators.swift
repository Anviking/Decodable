//
//  Operators.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

infix operator => { associativity left precedence 150 }
infix operator =>? { associativity left precedence 150 }

public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T {
    guard let dict = lhs as? [String: AnyObject] else {
        throw DecodingError.JSONNotObject(lhs)
    }
    
    guard let object = dict[rhs] else {
        throw DecodingError.MissingKey(rhs, dict)
    }
    
    return try T.decode(object)
}


public func => (lhs: AnyObject, rhs: String) throws -> [String: AnyObject] {
    guard let dict = lhs as? [String: AnyObject] else {
        throw DecodingError.JSONNotObject(lhs)
    }
    
    guard let object = dict[rhs] else {
        throw DecodingError.MissingKey(rhs, dict)
    }
    
    guard let result = object as? [String: AnyObject] else {
        throw DecodingError.TypeMismatch("JSON Object", object)
    }
    
    return result
}


public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T? {
    do {
        let value: T = try lhs => rhs
        return value
    } catch {
        return nil
    }
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    guard let dict = lhs as? [String: AnyObject] else {
        throw DecodingError.JSONNotObject(lhs)
    }
    
    guard let array = dict[rhs] as? [AnyObject] else {
        throw DecodingError.TypeMismatch("JSON Array", lhs)
    }
    
    var result = [T]()
    for obj in array {
        try result.append(T.decode(obj))
    }
    return result
}

public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    guard let dict = lhs as? [String: AnyObject] else {
        throw DecodingError.JSONNotObject(lhs)
    }
    
    guard let array = dict[rhs] as? [AnyObject] else {
        throw DecodingError.TypeMismatch("JSON Array", lhs)
    }
    
    var result = [T]()
    for obj in array {
        do {
            try result.append(T.decode(obj))
        } catch let DecodingError.TypeMismatch(a, b) {
            print("Optional Array Decoder: Type mismatch: \(a) \(b)")
        } catch let DecodingError.JSONNotObject(json) {
            print("Optional Array Decoder: JSON not object: \(json)")
        } catch let DecodingError.MissingKey(key, obj) {
            print("Optional Array Decoder: Missing key: \(key) \(obj)")
        } catch {
            print("Optional Array Decoder: Unknown Error")
        }
    }
    return result
}