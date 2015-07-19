//
//  Operators.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

infix operator => { associativity right precedence 150 }
infix operator =>? { associativity right precedence 150 }

typealias JSONDictionary = [String: AnyObject]

private func parse(object: AnyObject, key: String) throws -> AnyObject {
    let dict = try JSONDictionary.decode(object)
    guard let result = dict[key] else {
        let info = DecodingError.Info(object: object)
        throw DecodingError.MissingKey(key: key, info: info)
    }
    return result
}

private func catchErrorAndAppendPath<T>(path: String, block: ((AnyObject) throws -> T)) -> ((AnyObject) throws -> T)  {
    return { (obj: AnyObject) throws -> T in
        do {
            return try block(obj)
        } catch var error as DecodingError {
            error.info.path = [path] + error.info.path
            throw error
        }
    }
}

private func catchErrorAndSetRootObject<T>(object: AnyObject, block: (Void throws -> T)) throws -> T {
        do {
            return try block()
        } catch var error as DecodingError {
            error.info.rootObject = object
            throw error
        }
}

// MARK: Operators

// Middle
public func => <T: Decodable>(lhs: String, rhs: ((AnyObject) throws -> T)) -> ((AnyObject) throws -> T)
{
    return catchErrorAndAppendPath(lhs) { (obj: AnyObject) in
        return try rhs(parse(obj, key: lhs))
   }
}

// End
public func => <T: Decodable>(lhs: String, key: String) -> ((AnyObject) throws -> T)
{
    return lhs => { obj in
        let dict = try parse(obj, key: key)
        do {
            return try T.decode(dict)
        } catch var error as DecodingError {
            error.info.path = [key] + error.info.path
            throw error
        }
    }
}

// MARK: Beginning

public func => <T>(lhs: AnyObject, rhs: ((AnyObject) throws -> T)) throws -> T
{
    return try rhs(lhs)
}

public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T
{
    return try catchErrorAndSetRootObject(lhs) {
        try T.decode(parse(lhs, key: rhs))
    }
}

// MARK: Optionals

public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> T?
{
    do {
        return try T.decode(parse(lhs, key: rhs))
    } catch {
        return nil
    }
}

public func => <T>(lhs: AnyObject, rhs: ((AnyObject) throws -> T)) throws -> T?
{
    do {
        return try rhs(lhs)
    } catch {
        return nil
    }
}

// MARK: No inffered type

public func => (lhs: AnyObject, rhs: String) throws -> [String: AnyObject]
{
    return try JSONDictionary.decode(parse(lhs, key: rhs))
}

public func => (lhs: AnyObject, rhs: ((AnyObject) throws -> [String: AnyObject])) throws -> [String: AnyObject]
{
    return try JSONDictionary.decode(rhs(lhs))
}

private func printArrayError(error: DecodingError) {
    print("Error caught in nil-filtering Array Decoder (=>?): \(error)")
}
