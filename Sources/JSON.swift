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
    
    public func decodeSubobject<T>(at key: String, using decoder: (JSON) throws -> T) throws -> T {
        
        guard let result = try NSDictionary.decode(self)[key] else {
            let metadata = DecodingError.Metadata(path: [], object: object, rootObject: self)
            throw DecodingError.missingKey(key, metadata)
        }
        return try catchAndRethrow(self, [key]) { try decoder(JSON(object: result)) }
    }
    
    public func decodeSubobject<T>(at key: String, using decoder: (JSON) throws -> T) throws -> T? {
        guard let result = try NSDictionary.decode(self)[key] else { return nil }
        return try catchAndRethrow(self, [key]) { try decoder(JSON(object: result)) }
    }
}

extension JSON: Decodable {
    public static func decode(_ json: JSON) throws -> JSON {
        return json
    }
}

// MARK: Helpers

private func catchAndRethrow<T>(_ json: JSON, _ keyPath: [String], block: () throws -> T) throws -> T {
    do {
        return try block()
    } catch let error as DecodingError {
        var error = error
        error.metadata.path = keyPath + error.metadata.path
        error.metadata.rootObject = json.object
        throw error
    } catch let error {
        throw error
    }
}


