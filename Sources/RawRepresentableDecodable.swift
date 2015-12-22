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
public extension RawRepresentable where Self:Decodable {
    
    static func decode(json: AnyObject) throws -> Self {
        guard let rawValue = json as? Self.RawValue else {
            throw DecodingError.TypeMismatch(type: json.dynamicType, expectedType: Self.RawValue.self, info: DecodingError.Info(object: json))
        }
        guard let rawRepresentable = Self(rawValue: rawValue) else {
            throw DecodingError.UnexpectedValue(value: rawValue as! AnyObject, info: DecodingError.Info(object: json))
        }
        return rawRepresentable
    }
}
