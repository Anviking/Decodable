//
//  IntermediateResult.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-28.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

public struct IntermediateResult {
    
    public var object: AnyObject
    public var rootObject: AnyObject
    public var path: [String]
    
    private func _parse(key: String) throws -> IntermediateResult {
        let currentDict = try NSDictionary.decode(object)
        guard let result = currentDict[NSString(string: key)] else {
            let error = MissingKeyError(key: key, object: currentDict)
            throw error
        }
        return IntermediateResult(object: result, rootObject: rootObject, path: path + [key])
    }
    
    func parse(key: String) throws -> IntermediateResult {
        do {
            return try _parse(key)
        } catch let error as DecodingError {
            var error = error
            error.path = path + error.path
            error.rootObject = rootObject
            throw error
        } catch let error {
            throw error
        }
    }
    
    func parseSafely(key: String) -> IntermediateResult? {
        return try? _parse(key)
    }
    
    func decode<T>(decodeClosure: AnyObject throws -> T) throws -> T {
        do {
            return try decodeClosure(self.object)
        } catch let error as DecodingError {
            var error = error
            error.path = path + error.path
            error.rootObject = rootObject
            throw error
        } catch let error {
            throw error
        }
    }
}