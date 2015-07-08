//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

enum DecodingError: ErrorType {
    case MissingKey(String, Any)
    case TypeMismatch(String, Any)
    case JSONNotObject(AnyObject)
}

public protocol Decodable {
    static func decode(json: AnyObject) throws -> Self
}

extension String: Decodable {
    public static func decode(j: AnyObject) throws -> String {
        guard let result = j as? String else {
            throw DecodingError.TypeMismatch("String", j)
        }
        return result
    }
}

extension Int: Decodable {
    public static func decode(j: AnyObject) throws -> Int {
        guard let result = j as? Int else {
            throw DecodingError.TypeMismatch("Int", j)
        }
        return result
    }
}
