//
//  JSON.swift
//  Decodable
//
//  Created by Johannes Lund on 2017-11-24.
//  Copyright © 2017 anviking. All rights reserved.
//

import Foundation

public struct JSON {
    var object: Any
    
    public func decodeSubobject<T>(at keyPath: KeyPath, using decoder: (JSON) throws -> T) throws -> T {
        var current = self
        for (index, key) in keyPath.keys.enumerated() {
            guard let result = try NSDictionary.decode(current)[key] else {
                let currentPath = keyPath.keys[0 ..< index]
                let metadata = DecodingError.Metadata(path: Array(currentPath), object: current, rootObject: self)
                throw DecodingError.missingKey(key, metadata)
            }
            current = JSON(object: result)
        }
        return try catchAndRethrow(self, keyPath) { try decoder(current) }
    }
    
    public func decodeSubobject<T>(at keyPath: OptionalKeyPath, using decoder: (JSON) throws -> T) throws -> T? {
        var current = self
        
        for (index, key) in keyPath.keys.enumerated() {
            guard let result = try NSDictionary.decode(current)[key.key] else {
                if key.isRequired {
                    let currentPath = keyPath.keys[0 ..< index].map { $0.key }
                    let metadata = DecodingError.Metadata(path: currentPath, object: current, rootObject: self)
                    throw DecodingError.missingKey(key.key, metadata)
                } else {
                    return nil
                }
            }
            current = JSON(object: result)
        }
        
        return try catchAndRethrow(self, keyPath) { try decoder(current) }
    }
}

extension JSON: Decodable {
    public static func decode(_ json: JSON) throws -> JSON {
        return json
    }
}

// MARK: Helpers

private func catchAndRethrow<T>(_ json: JSON, _ keyPath: KeyPath, block: () throws -> T) throws -> T {
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

private func catchAndRethrow<T>(_ json: JSON, _ keyPath: OptionalKeyPath, block: () throws -> T) throws -> T {
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

