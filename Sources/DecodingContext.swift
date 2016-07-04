//
//  DecodingContext.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-04.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

public struct DecodingContext<Parameters> {
    var path: [String]
    var json: AnyObject
    var rootObject: AnyObject
    var parameters: Parameters
    
    init(json: AnyObject, path: [String] = [], rootObject: AnyObject, parameters: Parameters) {
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
        
        return self.map { _ in obj }
    }
    
    public func parseAndAcceptMissingKeys(keys: [String]) throws -> DecodingContext? {
        return try keys.reduce(self) { try $0.0?.parseAndAcceptMissingKey(key: $0.1) }
    }
    
    public func map(json closure: (AnyObject) -> AnyObject) -> DecodingContext {
        var new = self
        new.json = closure(json)
        return new
    }
    
    public func map<U>(parameters closure: (Parameters) -> U) -> DecodingContext<U> {
        return DecodingContext<U>(json: json, path: path, rootObject: rootObject, parameters: closure(parameters))
    }
    
    
    // MARK: Decoding with type inference
    
    // TODO: This should be generated automatically
    
    public func decode<A: Decodable where A.Parameters == Parameters>(keys: [String]) throws -> A  {
        return try A.decode(parse(keys: keys))
    }
}
