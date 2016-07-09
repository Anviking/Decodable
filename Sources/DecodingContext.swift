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
    
    init(json: AnyObject, parameters: Parameters) {
        self.json = json
        self.path = []
        self.rootObject = json
        self.parameters = parameters
    }
    
    init(json: AnyObject, path: [String] = [], rootObject: AnyObject, parameters: Parameters) {
        self.json = json
        self.path = path
        self.rootObject = rootObject
        self.parameters = parameters
    }
    
    public func parse(key: String) throws -> DecodingContext {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            let metadata = DecodingError.Metadata(object: json)
            throw DecodingError.missingKey(key, metadata)
        }
        
        var new = self
        new.json = obj
        return new
    }
    
    public func parse(key: OptionalKey) throws -> DecodingContext? {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key.key] else {
            if key.isRequired {
                let metadata = DecodingError.Metadata(object: json)
                throw DecodingError.missingKey(key.key, metadata)
            } else {
                return nil
            }
        }
        
        var new = self
        new.json = obj
        return new
    }
    
    public func parse(keyPath: KeyPath) throws -> DecodingContext {
        return try keyPath.keys.reduce(self) { try $0.0.parse(key: $0.1) }
    }
    
    public func parse(keyPath: OptionalKeyPath) throws -> DecodingContext? {
        return try keyPath.keys.reduce(self) { try $0.0?.parse(key: $0.1) }
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
    
    public func decode<A: Decodable where A.Parameters == Parameters>(keyPath: KeyPath) throws -> A  {
        return try A.decode(parse(keyPath: keyPath))
    }
}
