//
//  Parse.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-08-13.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

func parse(_ json: AnyObject, _ path: [String]) throws -> AnyObject {
    
    var currentDict = try NSDictionary.decode(json)
    
    // For error information
    var currentPath: [String] = []
    
    // Remove last key – it should not be decoded as NSDictionary
    var shorterPath = path
    let lastKey = shorterPath.removeLast()
    
    func objectForKey(_ dictionary: NSDictionary, key: String) throws -> AnyObject {
        guard let result = dictionary[NSString(string: key)] else {
            throw MissingKeyError(key: key, object: dictionary, path: currentPath)
        }
        return result
    }
    
    for key in shorterPath {
        currentDict = try NSDictionary.decode(objectForKey(currentDict, key: key))
        currentPath.append(key)
    }
    
    return try objectForKey(currentDict, key: lastKey)
}

func parseOptionally(_ json: AnyObject, _ path: [OptionalKey]) throws -> AnyObject? {
    var currentDict = try NSDictionary.decode(json)
    
    // For error information
    var currentPath: [String] = []
    
    // Remove last key – it should not be decoded as NSDictionary
    var shorterPath = path
    let lastKey = shorterPath.removeLast()
    
    func objectForKey(_ dictionary: NSDictionary, key: OptionalKey) throws -> AnyObject? {
        guard let result = dictionary[NSString(string: key.key)] else {
            if key.optional {
                return nil
            } else {
                throw MissingKeyError(key: key.key, object: dictionary, path: currentPath)
            }
        }
        return result
    }
    
    for key in shorterPath {
        guard let object = try objectForKey(currentDict, key: key) else {
            return nil
        }
        currentDict = try NSDictionary.decode(object)
        currentPath.append(key.key)
    }
    
    return try objectForKey(currentDict, key: lastKey)
}

public func parse<T>(_ json: AnyObject, path: [Key], decode: ((AnyObject) throws -> T)) throws -> T {
    let object = try parse(json, path.map {$0.key})
    return try catchAndRethrow(json, path.map {$0.key}) { try decode(object) }
}

public func parseOptionally<T>(_ json: AnyObject, path: [OptionalKey], decode: ((AnyObject) throws -> T?)) throws -> T? {
    guard let object = try parseOptionally(json, path) else {
        return nil
    }
    let lastPathIsOptional = path.last?.optional ?? false
    if lastPathIsOptional {
        return try catchAndRethrow(json, path.map {$0.key}) { try decode(object) }
    }
    return try catchAndRethrow(json, path.map {$0.key}) { try decode(object) }
}


/// Accepts null and MissingKeyError
func parseAndAcceptMissingKey<T>(_ json: AnyObject, path: [String], decode: ((AnyObject) throws -> T)) throws -> T? {
    guard let object = try catchMissingKeyAndReturnNil({ try parse(json, path) }) else {
        return nil
    }
    return try catchAndRethrow(json, path) { try catchNull(decode)(object) }
}


// MARK: - Helpers

func catchMissingKeyAndReturnNil<T>(_ closure: (Void) throws -> T) throws -> T? {
    do {
        return try closure()
    } catch is MissingKeyError {
        return nil
    }
}

func catchAndRethrow<T>(_ json: AnyObject, _ path: [String], block: (Void) throws -> T) throws -> T {
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
