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
        throw DecodingError.TypeMismatch(type: [String: AnyObject].self, object: lhs, path: [])
    }
    
    guard let object = dict[rhs] else {
        throw DecodingError.MissingKey(key: rhs, object: dict, path: [])
    }
    
    return try T.decode(object)
}


public func => (lhs: AnyObject, rhs: String) throws -> [String: AnyObject] {
    guard let dict = lhs as? [String: AnyObject] else {
        throw DecodingError.TypeMismatch(type: [String: AnyObject].self, object: lhs, path: [])
    }
    
    guard let object = dict[rhs] else {
        throw DecodingError.MissingKey(key: rhs, object: dict, path: [])
    }
    
    let result = try [String: AnyObject].decode(object)
    
    return result
}


public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> T? {
    do {
        let value: T = try lhs => rhs
        return value
    } catch {
        return nil
    }
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    guard let dict = lhs as? [String: AnyObject] else {
        throw DecodingError.TypeMismatch(type: [String: AnyObject].self, object: lhs, path: [])
    }
    
    guard let array = dict[rhs] as? [AnyObject] else {
        throw DecodingError.TypeMismatch(type: [AnyObject].self, object: lhs, path: [])
    }
    
    var result = [T]()
    for obj in array {
        try result.append(T.decode(obj))
    }
    return result
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> [T]? {
    do {
        let value: [T] = try lhs => rhs
        return value
    } catch {
        return nil
    }
}


public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T] {
    guard let dict = lhs as? [String: AnyObject] else {
        throw DecodingError.TypeMismatch(type: [String: AnyObject].self, object: lhs, path: [])
    }
    
    guard let array = dict[rhs] as? [AnyObject] else {
        throw DecodingError.TypeMismatch(type: [AnyObject].self, object: lhs, path: [])
    }
    
    var result = [T]()
    for obj in array {
        do {
            try result.append(T.decode(obj))
        } catch let error as DecodingError {
            printNilFilteringError(error.debugDescription)
        } catch {
            printNilFilteringError("Unknown Error")
        }
    }
    return result
}

func printNilFilteringError(string: String) {
    print("Error caught in nil-filtering array: \(string)")
}