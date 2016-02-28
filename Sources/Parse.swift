//
//  Parse.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-08-13.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/// Use reduce to traverse through a nested dictionary and find the object at a given path

func parse(key: String) -> (AnyObject throws -> AnyObject) {
    return { object in
        let currentDict = try NSDictionary.decode(object)
        guard let result = currentDict[NSString(string: key)] else {
            let error = MissingKeyError(key: key, object: currentDict)
            throw error
        }
        return result
    }
}

// MARK: - Helpers

func catchMissingKeyAndReturnNil<T>(closure: Void throws -> T) throws -> T? {
    do {
        return try closure()
    } catch is MissingKeyError {
        return nil
    }
}

func propagate<T>(json: AnyObject, _ path: String, block: Void throws -> T) throws -> T {
    do {
        return try block()
    } catch let error as DecodingError {
        var error = error
        error.path = [path] + error.path
        error.rootObject = json
        throw error
    } catch let error {
        throw error
    }
}
