//
//  Operators.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

// MARK: - Operators

infix operator => { associativity right precedence 150 }
infix operator =>? { associativity right precedence 150 }

// MARK: - Helpers

private func parse(object: AnyObject, key: String) throws -> AnyObject {
    let dict = try NSDictionary.decode(object)
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

// MARK: - Operator Overloads

// MARK: Default

/// Middle-overload for chained expression, returning <T: Decodable>.
public func => <T: Decodable>(lhs: String, rhs: ((AnyObject) throws -> T)) -> ((AnyObject) throws -> T)
{
    return catchErrorAndAppendPath(lhs) { (obj: AnyObject) in
        return try rhs(parse(obj, key: lhs))
   }
}

/// At-end-overload for chained expression, returning <T: Decodable>.
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

/// Beginning-overload for chained expression, returning <T>.
public func => <T>(lhs: AnyObject, rhs: ((AnyObject) throws -> T)) throws -> T
{
    return try rhs(lhs)
}

/// Beginning-overload for a non-nested keypath, returning <T: Decodable>.
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T
{
    return try catchErrorAndSetRootObject(lhs) {
        try T.decode(parse(lhs, key: rhs))
    }
}

// MARK: Optionals

/// Optional-overload (beginning) for no-nested keypath, returning <T: Decodable>?
public func => <T: Decodable>(lhs: AnyObject, rhs: String) -> T?
{
    do {
        return try T.decode(parse(lhs, key: rhs))
    } catch {
        return nil
    }
}

/// Optional-overload (beginning) for nested keypath, returning <T: Decodable>?
public func => <T>(lhs: AnyObject, rhs: ((AnyObject) throws -> T)) -> T?
{
    do {
        return try rhs(lhs)
    } catch {
        return nil
    }
}

// MARK: No inferred type

// If there is no inferred type, return NSDictionary so that chaining works
// E.g in let a: Int = json => "key1" => "key2" => "key3"
// the last two operators should "return" (vauge term, since it's probably a bit more complicated) 
// a NSDictionary


/// NSDictionary overload (beginning) for no-nested keypath
public func => (lhs: AnyObject, rhs: String) throws -> NSDictionary
{
    return try NSDictionary.decode(parse(lhs, key: rhs))
}

/// NSDictionary overload (beginning) for nested keypath
public func => (lhs: AnyObject, rhs: ((AnyObject) throws -> NSDictionary)) throws -> NSDictionary
{
    return try NSDictionary.decode(rhs(lhs))
}

/// NSDictionary overload (middle) for nested keypath
public func => (lhs: String, rhs: ((AnyObject) throws -> NSDictionary)) -> ((AnyObject) throws -> NSDictionary)
{
    return catchErrorAndAppendPath(lhs) { (obj: AnyObject) in
        return try rhs(parse(obj, key: lhs))
    }
}

/// NSDictionary overload (end) for nested keypath
public func => (lhs: String, key: String) -> ((AnyObject) throws -> NSDictionary)
{
    return lhs => { obj in
        let dict = try parse(obj, key: key)
        do {
            return try NSDictionary.decode(dict)
        } catch var error as DecodingError {
            error.info.path = [key] + error.info.path
            throw error
        }
    }
}