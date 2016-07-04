//
//  DecodingContext.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-04.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

public struct DecodingContext<T> {
    var path: [String]
    var json: AnyObject
    var rootObject: AnyObject
    var parameters: T
    
    init(json: AnyObject, path: [String] = [], rootObject: AnyObject, parameters: T) {
        self.json = json
        self.path = path
        self.rootObject = rootObject
        self.parameters = parameters
    }
    
    public func parse(key: String) throws -> DecodingContext {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            throw MissingKeyError(key: key, object: json)
        }
        
        var new = self
        new.json = obj
        return new
    }
    
    public func parse(keys: [String]) throws -> DecodingContext {
        return try keys.reduce(self) { try $0.0.parse(key: $0.1) }
    }
    
    public func parseAndAcceptMissingKey(key: String) throws -> DecodingContext? {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            throw MissingKeyError(key: key, object: json)
        }
        
        return with(json: obj)
    }
    
    public func parseAndAcceptMissingKeys(keys: [String]) throws -> DecodingContext? {
        return try keys.reduce(self) { try $0.0?.parseAndAcceptMissingKey(key: $0.1) }
    }
    
    public func with(json: AnyObject) -> DecodingContext {
        var new = self
        new.json = json
        return new
    }
    
    func map<U>(closure: (T) -> U) -> DecodingContext<U> {
        return DecodingContext<U>(json: json, path: path, rootObject: rootObject, parameters: closure(parameters))
    }
}
