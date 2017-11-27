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
    associativity: left
    higherThan: CastingPrecedence
}

infix operator =>  : DecodingPrecedence
infix operator =>? : DecodingPrecedence

public func => <A: Decodable>(json: JSON, key: String) throws -> A {
    return try json.decodeSubobject(at: key, using: A.decode)
}

public func => <A: Decodable>(json: JSON?, key: String) throws -> A? {
    return try json.map { try $0 => key }
}

public func =>? <A: Decodable>(json: JSON?, key: String) throws -> A? {
    return try json?.decodeSubobject(at: key, using: A?.decode)
        .flatMap({$0}) // flatten from A?? to A?
}
