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

extension NSDictionary {
    public static func decode(j: AnyObject) throws -> NSDictionary {
        guard let result = j as? NSDictionary else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: j.dynamicType, expectedType: self, info: info)
        }
        return result
    }
}

extension Array where Element: Decodable {
    public static func decode(j: AnyObject, ignoreInvalidObjects: Bool = false) throws -> [Element] {
        if ignoreInvalidObjects {
            return (try decodeArray { try? Element.decode($0) }(json: j) as [Element?]).flatMap {$0}
        } else {
            return try decodeArray(Element.decode)(json: j)
        }
    }
}
