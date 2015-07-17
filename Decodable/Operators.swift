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

private func parse(dict: [String: AnyObject], _ key: String) throws -> AnyObject {
    guard let object = dict[key] else {
        throw DecodingError.MissingKey(key: key, object: dict, path: [])
    }
    return object
}

public func => <T: Decodable>(object: AnyObject, key: String) throws -> T {
    let dict = try [String: AnyObject].decode(object)
    return try T.decode(parse(dict, key))
}


public func => (object: AnyObject, key: String) throws -> [String: AnyObject] {
    let dict = try [String: AnyObject].decode(object)
    return try [String: AnyObject].decode(parse(dict, key))}


public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> T? {
    do {
         return try lhs => rhs as T

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