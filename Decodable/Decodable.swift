//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol Decodable {
    static func decode(json: AnyObject) throws -> Self
}

public protocol MetaDecodable {
    typealias MetaType
    var objects: MetaType {get}
    static func decode(json: AnyObject, type: Decodable.Type) throws -> MetaType
}

public protocol Castable: Decodable {}

extension Castable {
    public static func decode(j: AnyObject) throws -> Self {
        guard let result = j as? Self else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}

// Implicit implementations are provided to aid debugging with time profiler.
// Most likely redundant, but keeping these here for now.

extension String: Castable {
    public static func decode(j: AnyObject) throws -> String {
        guard let result = j as? String else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}
extension Int: Castable {
    public static func decode(j: AnyObject) throws -> Int {
        guard let result = j as? Int else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}
extension Double: Castable {
    public static func decode(j: AnyObject) throws -> Double {
        guard let result = j as? Double else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}
extension Bool: Castable {
    public static func decode(j: AnyObject) throws -> Bool{
        guard let result = j as? Bool else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}

extension Dictionary: Castable {
    public static func decode(j: AnyObject) throws -> Dictionary {
        guard let result = j as? Dictionary else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}

extension NSDictionary {
    public static func decode(j: AnyObject) throws -> NSDictionary {
        guard let result = j as? NSDictionary else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}
