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

public func => (object: AnyObject, key: String) throws -> AnyObject {
    return try parse(object, key)
}

public func =>? (object: AnyObject, key: String) throws -> AnyObject? {
    return try? parse(object, key)
}



public func => (object: AnyObject, rhs: (IntermediateResult throws -> IntermediateResult)) throws -> AnyObject {
    return try rhs(IntermediateResult(object: object, rootObject: object, path: [])).object
}

public func =>? (object: AnyObject, parseClosure: (IntermediateResult throws -> IntermediateResult)) throws -> AnyObject? {
    return try parseClosure(IntermediateResult(object: object, rootObject: object, path: [])).object
}

public func => (lhs: String, rhs: String) -> (IntermediateResult throws -> IntermediateResult) {
    return { object in
        return try object.parseKey(lhs).parseKey(rhs)
    }
}

public func => (key: String, rhs: (IntermediateResult throws -> IntermediateResult)) -> (IntermediateResult throws -> IntermediateResult) {
    return { object in
        return try rhs(object.parseKey(key))
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
