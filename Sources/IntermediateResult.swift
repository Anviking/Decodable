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
    
    func parseKey(key: String) throws -> IntermediateResult {
        do {
            return try IntermediateResult(object: parse(object, key), rootObject: rootObject, path: path + [key])
        } catch let error as DecodingError {
            var error = error
            error.path = path
            error.rootObject = rootObject
            throw error
        } catch let error {
            throw error
        }
    }
    
    func parseSafely(key: String) -> IntermediateResult? {
        return try? IntermediateResult(object: parse(object, key), rootObject: rootObject, path: path + [key])
    }
    
    func decode<T>(decodeClosure: AnyObject throws -> T) throws -> T {
        do {
            return try decodeClosure(self.object)
        } catch let error as DecodingError {
            var error = error
            error.path = path
            error.rootObject = rootObject
            throw error
        } catch let error {
            throw error
        }
    }
}