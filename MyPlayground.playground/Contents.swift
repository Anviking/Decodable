//: Playground - noun: a place where people can play

//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol Decodable {
    static func decode(json: AnyObject) throws -> Self
}

public protocol MetaDecodable {
    typealias MetaType
    var objects: MetaType {get}
    static func decode(json: AnyObject, type: Decodable.Type) throws -> MetaType
}

public protocol Castable: Decodable {}

extension Castable {
    public static func decode(j: AnyObject) throws -> Self {
        guard let result = j as? Self else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}

// Implicit implementations are provided to aid debugging with time profiler.
// Most likely redundant, but keeping these here for now.

extension String: Castable {
    public static func decode(j: AnyObject) throws -> String {
        guard let result = j as? String else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}
extension Int: Castable {
    public static func decode(j: AnyObject) throws -> Int {
        guard let result = j as? Int else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}
extension Double: Castable {
    public static func decode(j: AnyObject) throws -> Double {
        guard let result = j as? Double else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}
extension Bool: Castable {
    public static func decode(j: AnyObject) throws -> Bool{
        guard let result = j as? Bool else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}

extension Dictionary: Castable {
    public static func decode(j: AnyObject) throws -> Dictionary {
        guard let result = j as? Dictionary else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}

extension NSDictionary {
    public static func decode(j: AnyObject) throws -> NSDictionary {
        guard let result = j as? NSDictionary else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}


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


let j: AnyObject = NSArray(array: [
    NSDictionary(dictionary: ["key":"value", "key2":"value"]),
    NSDictionary(dictionary: [ "key":"value", "key2":"value"])
    ])

//
//  DecodingError.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-17.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation



public enum DecodingError: ErrorType, CustomDebugStringConvertible {
    
    public struct Info {
        
        public init(object: AnyObject, rootObject: AnyObject? = nil, path: [String] = []) {
            self.object = object
            self.rootObject = rootObject
            self.path = path
        }
        
        var path: [String]
        var object: AnyObject?
        var rootObject: AnyObject?
        
        var formattedPath: String {
            return ".".join(path)
        }
    }
    
    case MissingKey(key: String, info: Info)
    case TypeMismatch(type: Any.Type, info: Info)
    
    var info: Info {
        get {
            switch self {
            case MissingKey(key: _, let info):
                return info
            case TypeMismatch(_, let info):
                return info
            }
        }
        set {
            switch self {
            case MissingKey(let key, _):
                self = MissingKey(key: key, info: newValue)
            case TypeMismatch(let type, _):
                self = TypeMismatch(type: type, info: newValue)
            }
        }
    }
    
    public var debugDescription: String {
        switch self {
        case .MissingKey(let key, let info):
            return "Missing Key \(key) in \(info.formattedPath) \(info.object)"
        case .TypeMismatch(let type, let info):
            return "TypeMismatch \(info.formattedPath) type: \(type), object: \(info.object)"
        }
    }
}


struct Foo: Decodable {
    let key: String
    let key2: String
    
    static func decode(j: AnyObject) throws -> Foo {
        return try Foo(key: j => "key", key2: j => "key2")
    }
}

do {
    try _ = Foo.decode(<#T##j: AnyObject##AnyObject#>)
}

