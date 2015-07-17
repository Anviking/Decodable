//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public enum DecodingError: ErrorType {
    case MissingKey(String, Any)
    case TypeMismatch(String, Any)
    case JSONNotObject(AnyObject)
}

public protocol Decodable {
    static func decode(json: AnyObject) throws -> Self
}

public protocol Castable: Decodable {}
extension Castable {
    public static func decode(j: AnyObject) throws -> Self {
        guard let result = j as? Self else {
            throw DecodingError.TypeMismatch(String(self), j)
        }
        return result
    }
}

extension String: Castable {}
extension Int: Castable {}
extension Double: Castable {}
extension Bool: Castable {}
extension Dictionary: Castable {}