//
//  Parse.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-08-13.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/// Use reduce to traverse through a dictionary and find the object at a given path
func parse(json: AnyObject, _ path: [String]) throws -> AnyObject {
    return try path.reduce((json, []), combine: { (a:(object: AnyObject, currentPath: [String]), key: String) in
        let currentDict = try NSDictionary.decode(a.object)
        guard let result = currentDict[NSString(string: key)] else {
            let info = DecodingError.Info(object: currentDict, rootObject: json, path: a.currentPath)
            throw DecodingError.MissingKey(key: key, info: info)
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

/// Accepts null and missingKey
public func parseAndAcceptMissingKey<T>(json: AnyObject, path: [String], decode: (AnyObject throws -> T)) throws -> T? {
    guard let object = try catchMissingKeyAndReturnNil({ try parse(json, path) }) else {
        return nil
    }
    return try catchAndRethrow(json, path) { try decode(object) }
}


// MARK: - Helpers

func catchMissingKeyAndReturnNil<T>(closure: Void throws -> T) throws -> T? {
    do {
        return try closure()
    } catch DecodingError.MissingKey {
        return nil
    }
}

func catchAndRethrow<T>(json: AnyObject, _ path: [String], block: Void throws -> T) throws -> T {
    do {
        return try block()
    } catch let error as DecodingError {
        var new_error = error
        new_error.info.path = path + error.info.path
        new_error.info.rootObject = json
        throw new_error
    } catch let error {
        throw error
    }
}
