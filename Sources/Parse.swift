//
//  Parse.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-08-13.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/// Use reduce to traverse through a nested dictionary and find the object at a given path
func parse(_ json: AnyObject, _ keyPath: KeyPath) throws -> AnyObject {
    return try keyPath.keys.reduce((json, []), combine: { (a:(object: AnyObject, currentPath: [String]), key: String) in
        let currentDict = try NSDictionary.decode(a.object)
        guard let result = currentDict[NSString(string: key)] else {
            let metadata = DecodingError.Metadata(path: a.currentPath, object: a.object, rootObject: json)
            throw DecodingError.missingKey(key, metadata)
        }
    
        var path = a.currentPath
        path.append(key)
        return (result, path)
    }).object
}

// FIXME: Make more beautiful
func parseOptionally(_ json: AnyObject, _ path: OptionalKeyPath) throws -> AnyObject? {
    var currentDict = try NSDictionary.decode(json)
    
    // For error information
    var currentPath: [String] = []
    
    // Remove last key – it should not be decoded as NSDictionary
    var shorterPath = path.keys
    let lastKey = shorterPath.removeLast()
    
    func objectForKey(_ dictionary: NSDictionary, key: OptionalKey) throws -> AnyObject? {
        guard let result = dictionary[NSString(string: key.key)] else {
            if key.isRequired {
                let metadata = DecodingError.Metadata(path: currentPath, object: dictionary, rootObject: json)
                throw DecodingError.missingKey(key.key, metadata)
            } else {
                return nil
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
public func parse<T>(_ json: AnyObject, keyPath: KeyPath, decode: ((AnyObject) throws -> T)) throws -> T {
    let object = try parse(json, keyPath)
    return try catchAndRethrow(json, keyPath) { try decode(object) }
}

/// Accepts null and missingKeyError
func parseAndAcceptMissingKey<T>(_ json: AnyObject, keyPath: OptionalKeyPath, decode: ((AnyObject) throws -> T)) throws -> T? {
    guard let object = try parseOptionally(json, keyPath) else { return nil }
    return try catchAndRethrow(json, keyPath) { try catchNull(decode)(object) }
}


// MARK: - Helpers

func catchMissingKeyAndReturnNil<T>(_ closure: (Void) throws -> T) throws -> T? {
    do {
        return try closure()
    } catch DecodingError.missingKey {
        return nil
    }
}

func catchAndRethrow<T>(_ json: AnyObject, _ keyPath: KeyPath, block: (Void) throws -> T) throws -> T {
    do {
        return try block()
    } catch let error as DecodingError {
        var error = error
        error.metadata.path = keyPath.keys + error.metadata.path
        error.metadata.rootObject = json
        throw error
    } catch let error {
        throw error
    }
}

func catchAndRethrow<T>(_ json: AnyObject, _ keyPath: OptionalKeyPath, block: (Void) throws -> T) throws -> T {
    do {
        return try block()
    } catch let error as DecodingError {
        var error = error
        error.metadata.path = keyPath.keys.map{$0.key} + error.metadata.path
        error.metadata.rootObject = json
        throw error
    } catch let error {
        throw error
    }
}
