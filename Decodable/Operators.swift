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

typealias JSONDictionary = [String: AnyObject]

private func parse(object: AnyObject, key: String) throws -> AnyObject {
    let dict = try JSONDictionary.decode(object)
    guard let result = dict[key] else {
        throw DecodingError.MissingKey(path: [], key: key, object: dict)
    }
    return result
}

private func catchErrorAndAppendPath<T>(path: String, block: ((AnyObject) throws -> T)) -> ((AnyObject) throws -> T)  {
    return { (obj: AnyObject) throws -> T in
        do {
            return try block(obj)
        } catch var error as DecodingError {
            error.path = [path] + error.path
            throw error
        }
    }
}

// MARK: Operators

// Middle
func => <T: Decodable>(lhs: String, rhs: ((AnyObject) throws -> T)) -> ((AnyObject) throws -> T)
{
    return catchErrorAndAppendPath(lhs) { (obj: AnyObject) in
        return try rhs(parse(obj, key: lhs))
   }
}

// End
func => <T: Decodable>(lhs: String, key: String) -> ((AnyObject) throws -> T)
{
    return lhs => { obj in
        try T.decode(parse(obj, key: key))
    }
}

// MARK: Beginning

func => <T>(lhs: AnyObject, rhs: ((AnyObject) throws -> T)) throws -> T
{
    return try rhs(lhs)
}

func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T
{
    return try T.decode(parse(lhs, key: rhs))
}

// MARK: Optionals

func => <T: Decodable>(lhs: AnyObject, rhs: String) -> T?
{
    do {
        return try T.decode(parse(lhs, key: rhs))
    } catch {
        return nil
    }
}

// MARK: Optional Arrays

func => <T: Decodable>(lhs: AnyObject, rhs: String) -> [T]?
{
    do {
        return try lhs => rhs as [T]
    } catch {
        return nil
    }
}

// MARK: No inffered type

func => (lhs: AnyObject, rhs: String) throws -> JSONDictionary
{
    return try JSONDictionary.decode(parse(lhs, key: rhs))
}


private func printArrayError(error: DecodingError) {
    print("Error caught in nil-filtering Array Decoder (=>?): \(error)")
}
