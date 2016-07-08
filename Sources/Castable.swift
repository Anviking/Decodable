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
    public static func decode(j: AnyObject) throws -> Self {
        guard let result = j as? Self else {
            throw TypeMismatchError(expectedType: self, receivedType: j.dynamicType, object: j)
        }
        return result
    }
}

extension String: Castable {}
extension Int: Castable {}
extension Double: Castable {}
extension Bool: Castable {}

