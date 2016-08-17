//
//  RawRepresentableDecodable.swift
//  Decodable
//
//  Created by Daniel Garbień on 06/11/15.
//  Copyright © 2015 anviking. All rights reserved.
//

/**
 * Extends all RawRepresentables (enums) which are also Decodable with decode implementation.
 *
 * I could not find a way to implicitly declare RawRepresentable conforming to Decodable, what would make all enums Decodable automatically.
 * Because of that for an enum to be compatible with Decodable operators it must be declared as implementing Decodable protocol.
 */
public extension RawRepresentable where RawValue: Decodable, Self: Decodable {
    
    static func decode(_ json: Any) throws -> Self {
        let rawValue = try RawValue.decode(json)
        guard let rawRepresentable = Self(rawValue: rawValue) else {
            let metadata = DecodingError.Metadata(object: json)
            throw DecodingError.rawRepresentableInitializationError(rawValue: rawValue, metadata)
        }
        return rawRepresentable
    }
}
