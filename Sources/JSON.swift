//
//  JSON.swift
//  Decodable
//
//  Created by Johannes Lund on 2017-03-03.
//  Copyright © 2017 anviking. All rights reserved.
//

import Foundation

public struct JSON: Decodable {
    var path: [String]
    var json: Any
    var rootObject: Any
    //var parameters: T

    
    init(_ value: Any, path: [String] = [], rootObject: Any? = nil) {
        self.json = value
        self.path = path
        self.rootObject = rootObject ?? value
    }
    
    var metadata: DecodingError.Metadata {
        return DecodingError.Metadata(path: path, object: json, rootObject: rootObject)
    }
    
    public func parse<T: Decodable>(key: String) throws -> T {
        let dict = try NSDictionary.decode(self)
        guard let obj = dict[key] else {
            throw DecodingError.missingKey(key, metadata)
        }
        
        let new = with(json: obj)
        return try T.decode(new)
    }
    
    public static func decode(_ json: JSON) throws -> JSON {
        return json
    }
    
    public func parse<T: Decodable>(key: OptionalKey) throws -> T? {
        let dict = try NSDictionary.decode(self)
        guard let obj = dict[key] else {
            if key.isRequired {
                throw DecodingError.missingKey(key.key, metadata)
            } else {
                return nil
            }
        }
        
        let new = with(json: obj)
        return try T.decode(new)
    }
    
    public func parse<T: Decodable>(keyPath: KeyPath) throws -> T {
        let json = try keyPath.keys.reduce(self) { try $0.0.parse(key: $0.1) }
        return try T.decode(json)
    }
    
    public func parse<T: Decodable>(keyPath: OptionalKeyPath) throws -> T? {
        let json = try keyPath.keys.reduce(self) { try $0.0?.parse(key: $0.1) }
        return try json.map(T.decode)
    }
    
    public func parse<T>(keyPath: KeyPath, decoder: (JSON) throws -> T) throws -> T {
        let json = try keyPath.keys.reduce(self) { try $0.0.parse(key: $0.1) }
        return try decoder(json)
    }
    
    public func parse<T>(keyPath: OptionalKeyPath, decoder: (JSON) throws -> T) throws -> T? {
        let json = try keyPath.keys.reduce(self) { try $0.0?.parse(key: $0.1) }
        return try json.map(decoder)
    }
    
    public func with(json: Any) -> JSON {
        var new = self
        new.json = json
        return new
    }
    
//    func map<U>(closure: (T) -> U) -> DecodingContext<U> {
//        return DecodingContext<U>(json: json, path: path, rootObject: rootObject, parameters: closure(parameters))
//    }
}
