//
//  DecodingError.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-17.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol DecodingError: ErrorType {
    var path: [String] {get set}
    var object: AnyObject? {get set}
    var rootObject: AnyObject? {get set}
    var formattedPath: String {get}
}

extension DecodingError {
    public var formattedPath: String {
        return path.joinWithSeparator(".")
    }
}

public struct TypeMismatch: DecodingError {
    public let expectedType: Any.Type
    public let recievedType: Any.Type
    
    public var path: [String]
    public var object: AnyObject?
    public var rootObject: AnyObject?
    
    public var debugDescription: String {
        return "TypeMismatch expected: \(expectedType) but \(object) is of type \(recievedType) in \(formattedPath)"    }
}

public struct MissingKey: DecodingError {
    public let key: String
    
    public var path: [String]
    public var object: AnyObject?
    public var rootObject: AnyObject?
    
    public var debugDescription: String {
        return "Missing Key \(key) in \(formattedPath) \(object)"
    }
}

public struct RawRepresentableInitializationFailure: DecodingError {
    public let type: Any.Type
    public let rawValue: Any
    
    public var path: [String]
    public var object: AnyObject?
    public var rootObject: AnyObject?
    
    public var debugDescription: String {
        return "RawRepresentableInitializationFailure: \(rawValue) could not be used to initialize \(type). (path: \(path))"
    }
}

// Allow types to be used in pattern matching
// E.g case TypeMismatch(NSNull.self, _, _) but be careful
// You probably rather want to modify the decode-closure
// There are overloads for this
public func ~=<T>(lhs: T.Type, rhs: Any.Type) -> Bool {
    return lhs == rhs
}

