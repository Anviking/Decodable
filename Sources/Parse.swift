//
//  Parse.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-08-13.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

func parse(_ json: Any, _ keyPath: KeyPath) throws -> Any {
    var currentDict = json
    
    for (index, key) in keyPath.keys.enumerated() {
        guard let result = try NSDictionary.decode(currentDict)[key] else {
            let currentPath = keyPath.keys[0 ..< index]
            let metadata = DecodingError.Metadata(path: Array(currentPath), object: currentDict, rootObject: json)
            throw DecodingError.missingKey(key, metadata)
        }
        
        currentDict = result
    }
    
    return currentDict
}

func parse(_ json: Any, _ path: OptionalKeyPath) throws -> Any? {
    var currentDict = json
    
    for (index, key) in path.keys.enumerated() {
        guard let result = try NSDictionary.decode(currentDict)[key.key] else {
            if key.isRequired {
                let currentPath = path.keys[0 ..< index].map { $0.key }
                let metadata = DecodingError.Metadata(path: currentPath, object: currentDict, rootObject: json)
                throw DecodingError.missingKey(key.key, metadata)
            } else {
                return nil
            }
        }
        currentDict = result
    }
    
    return currentDict
}
public func parse<T>(_ json: Any, keyPath: KeyPath, decoder: ((Any) throws -> T)) throws -> T {
    let object = try parse(json, keyPath)
    return try catchAndRethrow(json, keyPath) { try decoder(object) }
}

// FIXME: Should perhaps not return T?, but this way we don't have to flatMap in certain overloads
public func parse<T>(_ json: Any, keyPath: OptionalKeyPath, decoder: ((Any) throws -> T?)) throws -> T? {
    guard let object = try parse(json, keyPath) else { return nil }
    return try catchAndRethrow(json, keyPath) { try decoder(object) }
}


// MARK: - Helpers

func catchMissingKeyAndReturnNil<T>(_ closure: (Void) throws -> T) throws -> T? {
    do {
        return try closure()
    } catch DecodingError.missingKey {
        return nil
    }
}

func catchAndRethrow<T>(_ json: Any, _ keyPath: KeyPath, block: (Void) throws -> T) throws -> T {
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

func catchAndRethrow<T>(_ json: Any, _ keyPath: OptionalKeyPath, block: (Void) throws -> T) throws -> T {
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
