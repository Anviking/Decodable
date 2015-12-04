//
//  Parse.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-08-13.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public func parse<T>(json: AnyObject, path: [String], decode: (AnyObject throws -> T)) throws -> T {
    
    var object = json
    
    if let lastKey = path.last {
        var path = path
        path.removeLast()
        
        var currentDict = try NSDictionary.decode(json)
        var currentPath: [String] = []
        
        func objectForKey(dictionary: NSDictionary, key: String) throws -> AnyObject {
            guard let result = dictionary[NSString(string: key)] else {
                let info = DecodingError.Info(object: dictionary, rootObject: json, path: currentPath)
                throw DecodingError.MissingKey(key: key, info: info)
            }
            return result
        }
        
        for key in path {
            currentDict = try NSDictionary.decode(objectForKey(currentDict, key: key))
            currentPath.append(key)
        }
        
        
        
        object = try objectForKey(currentDict, key: lastKey)
    }
    
    return try catchAndRethrow(json, path) { try decode(object) }
    
}


// MARK: - Helpers

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
