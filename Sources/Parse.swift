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
    return try path.reduce((json, []), combine: { (a:(object: AnyObject, currentPath: [String]), key: String) in
        let currentDict = try NSDictionary.decode(a.object)
        guard let result = currentDict[NSString(string: key)] else {
            var error = MissingKeyError(key: key, object: currentDict)
            error.path = a.currentPath
            error.rootObject = json
            throw error
        }
        
        var path = a.currentPath
        path.append(key)
        return (result, path)
    }).object
}

public func parse<T>(json: AnyObject, path: [String], decode: (AnyObject throws -> T)) throws -> T {
    let object = try parse(json, path)
    return try catchAndRethrow(json, path) { try decode(object) }
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
