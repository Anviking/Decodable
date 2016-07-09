//
//  Castable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-09-25.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol Castable: Decodable {}

extension Castable {
    public static func decode(_ j: AnyObject) throws -> Self {
        guard let result = j as? Self else {
            let metadata = DecodingError.Metadata(object: j)
            throw DecodingError.typeMismatch(expected: self, actual: j.dynamicType, metadata)
        }
        return result
    }
}

extension String: Castable {}
extension Int: Castable {}
extension Double: Castable {}
extension Bool: Castable {}

