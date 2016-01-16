//
//  DecodingError.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-17.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/// Errors conforming DecodingError will be caught and rethrown in the decoding process with updated metadata.
public protocol DecodingError: ErrorType {
    /// The JSON key path to the object that failed to be decoded
    var path: [String] {get set}

    /// The object that failed to be decoded
    var object: AnyObject {get}
    
    /// The root JSON object for which the `path` can be used to find `object`
    var rootObject: AnyObject? {get set}
    
    
    var formattedPath: String {get}
}

extension DecodingError {
    /// Represents the path to the object that failed decoding with "." as a separator.
    public var formattedPath: String {
        return path.joinWithSeparator(".")
    }
}

public struct TypeMismatchError: DecodingError {

    public init(expectedType: Any.Type, recievedType: Any.Type, object: AnyObject) {
        self.expectedType = expectedType
        self.recievedType = recievedType
        self.object = object
        self.path = []
    }

    public let expectedType: Any.Type
    public let recievedType: Any.Type
    
    public var path: [String]
    public let object: AnyObject
    public var rootObject: AnyObject?
    
    public var debugDescription: String {
        return "TypeMismatchError expected: \(expectedType) but \(object) is of type \(recievedType) in \(formattedPath)"    }
}

public struct MissingKeyError: DecodingError {

    public let key: String
    
    public var path: [String]
    public let object: AnyObject
    public var rootObject: AnyObject?
    
    public init(key: String, object: AnyObject) {
        self.key = key
        self.object = object
        self.path = []
    }
    
    public var debugDescription: String {
        return "Missing Key \(key) in \(formattedPath) \(object)"
    }
}

public struct RawRepresentableInitializationError: DecodingError {
    public let type: Any.Type
    public let rawValue: Any
    
    public var path: [String]
    public let object: AnyObject
    public var rootObject: AnyObject?
    
    public init(type: Any.Type, rawValue: Any, object: AnyObject) {
        self.rawValue = rawValue
        self.type = type
        self.object = object
        self.path = []
    }
    
    public var debugDescription: String {
        return "RawRepresentableInitializationError: \(rawValue) could not be used to initialize \(type). (path: \(path))"
    }
}

// Allow types to be used in pattern matching
// E.g case TypeMismatchError(NSNull.self, _, _) but be careful
// You probably rather want to modify the decode-closure
// There are overloads for this
public func ~=<T>(lhs: T.Type, rhs: Any.Type) -> Bool {
    return lhs == rhs
}

