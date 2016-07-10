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
    typealias Parameters = Void
    public static func decode(_ context: DecodingContext<Void>) throws -> Self {
        guard let result = context.json as? Self else {
            throw context.typeMismatch(expectedType: self)
        }
        return result
    }
}

extension String: Castable {}
extension Int: Castable {}
extension Double: Castable {}
extension Bool: Castable {}

