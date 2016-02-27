//
//  Operators.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

// MARK: - Operators

infix operator => { associativity right precedence 150 }
infix operator =>? { associativity right precedence 150 }

public func => (lhs: AnyObject, rhs: String) throws -> AnyObject {
    return try parse(lhs, path: rhs.toJSONPathArray(), decode: { $0 })
}

public func =>? (lhs: AnyObject, rhs: String) throws -> AnyObject? {
    return try parseAndAcceptMissingKey(lhs, path: rhs.toJSONPathArray() , decode: { $0 })
}


// MARK: - JSONPath

/// Enables parsing nested objects e.g json => "a" => "b"
/// Uses \u{0} (null) as a separator
public func => (lhs: String, rhs: String) -> String {
    return lhs + String(JSONPathSeparator) + rhs
}

// You can't have this in a key. Sorry.
// This dramatically simplifies the implementation, halves the number of overloads required.
// If this is a bad idea, please tell me.
// http://stackoverflow.com/questions/1879860/most-reliable-split-character
private let JSONPathSeparator = Character("\u{0}")

extension String {
    func toJSONPathArray() -> [String] {
		return self.characters.split(JSONPathSeparator).map(String.init)
    }
}

// MARK: Helpers

func catchNull<T>(decodeClosure: (AnyObject) throws -> T) -> (AnyObject) throws -> T? {
    return { json in
        if json is NSNull {
            return nil
        } else {
            return try decodeClosure(json)
        }
    }
}
