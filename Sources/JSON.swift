//
//  JSON.swift
//  Decodable
//
//  Created by Johannes Lund on 2017-03-03.
//  Copyright © 2017 anviking. All rights reserved.
//

import Foundation

public struct JSON: Decodable {
    var json: Any
    var metadata: DecodingError.Metadata
    //var parameters: T
    
    
    public init(value: Any, metadata: DecodingError.Metadata? = nil) {
        self.json = value
        self.metadata = metadata ?? DecodingError.Metadata(object: value)
    }
    
    public init(jsonData: Data, options: JSONSerialization.ReadingOptions = []) throws {
        try self.init(value: JSONSerialization.jsonObject(with: jsonData, options: options))
    }
    
    
    
    public func parse<T: Decodable>(key: String, file: String = #file, line: Int = #line, function: String = #function) throws -> T {
        let dict = try decode(using: NSDictionary.decode)
        guard let obj = dict[key] else {
            throw DecodingError.missingKey(key, metadata)
        }
        
        // TODO: Make Metadata as imutable as appropriate
        var new = with(json: obj)
        new.metadata.path += [key]
        new.metadata.object = obj
        new.metadata.file = file
        new.metadata.line = line
        new.metadata.function = function
        
        return try new.decode(using: T.decode)
    }
    
    public static func decode(_ json: JSON) throws -> JSON {
        return json
    }
    
    public func parse<T: Decodable>(key: OptionalKey, file: String = #file, line: Int = #line, function: String = #function) throws -> T? {
        let dict = try decode(using: NSDictionary.decode)
        guard let obj = dict[key.key] else {
            if key.isRequired {
                throw DecodingError.missingKey(key.key, metadata)
            } else {
                return nil
            }
        }
        
        var new = with(json: obj)
        new.metadata.path += [key.key]
        new.metadata.object = obj
        new.metadata.file = file
        new.metadata.line = line
        new.metadata.function = function
        return try new.decode(using: T.decode)
    }
    
    public func parse<T: Decodable>(keyPath: KeyPath, file: String = #file, line: Int = #line, function: String = #function) throws -> T {
        let json = try keyPath.keys.reduce(self) { try $0.0.parse(key: $0.1, file: file) }
        return try json.decode(using: T.decode)
    }
    
    public func parse<T: Decodable>(keyPath: OptionalKeyPath, file: String = #file, line: Int = #line, function: String = #function) throws -> T? {
        let json = try keyPath.keys.reduce(self) { try $0.0?.parse(key: $0.1, file: file, line: line, function: function) }
        return try json?.decode(using: T.decode)
    }
    
    public func parse<T>(keyPath: KeyPath, file: String = #file, line: Int = #line, function: String = #function, decoder: (JSON) throws -> T) throws -> T {
        let json = try keyPath.keys.reduce(self) { try $0.0.parse(key: $0.1, file: file, line: line, function: function) }
        return try json.decode(using: decoder)
    }
    
    public func parse<T>(keyPath: OptionalKeyPath, file: String = #file, line: Int = #line, function: String = #function, decoder: (JSON) throws -> T) throws -> T? {
        let json = try keyPath.keys.reduce(self) { try $0.0?.parse(key: $0.1, file: file, line: line, function: function) }
        return try json?.decode(using: decoder)
    }
    
    public func with(json: Any) -> JSON {
        var new = self
        new.json = json
        return new
    }
    
    public func map(_ f: (Any) -> Any) -> JSON {
        var new = self
        new.json = f(json)
        return new
    }
    
    private func decode<T>(using decoder: (JSON) throws -> T) throws -> T {
        return try decoder(self)
    }
    
    //    func map<U>(closure: (T) -> U) -> DecodingContext<U> {
    //        return DecodingContext<U>(json: json, path: path, rootObject: rootObject, parameters: closure(parameters))
    //    }
}
