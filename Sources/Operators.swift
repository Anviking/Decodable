//
//  Operators.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

// MARK: - Operators

precedencegroup DecodingPrecedence {
    associativity: right
    higherThan: CastingPrecedence
}

infix operator =>  : DecodingPrecedence
infix operator =>? : DecodingPrecedence


public func => <A: Decodable>(json: JSON, keyPath: KeyPath) throws -> A {
    return try json.decodeSubobject(at: keyPath, using: A.decode)
}

public func =>? <A: Decodable>(json: JSON, keyPath: OptionalKeyPath) throws -> A? {
    return try json.decodeSubobject(at: keyPath, using: A?.decode)
        .flatMap({$0}) // flatten from A?? to A?
}
