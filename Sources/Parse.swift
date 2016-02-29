//
//  Parse.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-08-13.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/// Use reduce to traverse through a nested dictionary and find the object at a given path
func parse(json: AnyObject, _ path: [String]) throws -> AnyObject {
    
    var object = json
    
    guard let lastKey = path.last else {
        return json
    }
    
    var path = path
    path.removeLast()
    
    var currentDict = try NSDictionary.decode(json)
    var currentPath: [String] = []
    
    func objectForKey(dictionary: NSDictionary, key: String) throws -> AnyObject {
        guard let result = dictionary[NSString(string: key)] else {
            throw MissingKeyError(key: key, object: object, path: currentPath)
        }
        return result
    }
    
    for key in path {
        currentDict = try NSDictionary.decode(objectForKey(currentDict, key: key))
        currentPath.append(key)
    }
    
    return try objectForKey(currentDict, key: lastKey)
}

func parseOptionally(json: AnyObject, _ path: [OptionalKey]) throws -> AnyObject? {
    
    var object = json
    
    guard let lastKey = path.last else {
        return json
    }
    
    var path = path
    path.removeLast()
    
    var currentDict = try NSDictionary.decode(json)
    var currentPath: [String] = []
    
    func objectForKey(dictionary: NSDictionary, key: OptionalKey) throws -> AnyObject? {
        guard let result = dictionary[NSString(string: key.key)] else {
            if key.optional {
                return nil
            } else {
                throw MissingKeyError(key: key.key, object: object)
            }
        }
        return result
    }
    
    for key in path {
        guard let object = try  objectForKey(currentDict, key: key) else {
            return nil
        }
        currentDict = try NSDictionary.decode(object)
        currentPath.append(key.key)
    }
    
    return try objectForKey(currentDict, key: lastKey)
}

public func parse<T>(json: AnyObject, path: [Key], decode: (AnyObject throws -> T)) throws -> T {
    let object = try parse(json, path.map {$0.key})
    return try catchAndRethrow(json, path.map {$0.key}) { try decode(object) }
}

public func parseOptionally<T>(json: AnyObject, path: [OptionalKey], decode: (AnyObject throws -> T?)) throws -> T? {
    guard let object = try parseOptionally(json, path) else {
        return nil
    }
    return try catchAndRethrow(json, path.map {$0.key}) { try decode(object) }
}


/// Accepts null and MissingKeyError
func parseAndAcceptMissingKey<T>(json: AnyObject, path: [String], decode: (AnyObject throws -> T)) throws -> T? {
    guard let object = try catchMissingKeyAndReturnNil({ try parse(json, path) }) else {
        return nil
    }
    return try catchAndRethrow(json, path) { try catchNull(decode)(object) }
}


// MARK: - Helpers

func catchMissingKeyAndReturnNil<T>(closure: Void throws -> T) throws -> T? {
    do {
        return try closure()
    } catch is MissingKeyError {
        return nil
    }
}

func catchAndRethrow<T>(json: AnyObject, _ path: [String], block: Void throws -> T) throws -> T {
    do {
        return try block()
    } catch let error as DecodingError {
        var error = error
        error.path = path + error.path
        error.rootObject = json
        throw error
    } catch let error {
        throw error
    }
}
