//
//  DecodingError.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-17.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public enum DecodingError: Error, Equatable {
    
    /// `DecodingError.Metadata` provides information about
    /// where an `DecodingError` was thrown in the JSON 
    /// object graph.
    public struct Metadata: Equatable {
        
        public init(path: [String] = [], object: Any, rootObject: Any? = nil) {
            self.path = path
            self.object = object
            self.rootObject = rootObject
        }
        
        /// The JSON key path to the object that failed to be decoded
        public var path: [String]
        
        /// The JSON object that failed to be decoded
        public let object: Any
        
        /// The root JSON object for which the `path` can be used to find `object`
        public var rootObject: Any?
        
        /// Represents the path to the object that failed decoding with "." as a separator.
        public var formattedPath: String {
            return path.joined(separator: ".")
        }
    }
    
    /// Thrown when optional casting from `Any` fails.
    ///
    /// This can happen both when trying to access a key on a object
    /// that isn't a `NSDictionary`, and failing to cast a `Castable`
    /// primitive.
    case typeMismatch(expected: Any.Type, actual: Any.Type, Metadata)
    
    /// Thrown when a given, required, key was not found in a dictionary.
    case missingKey(String, Metadata)
    
    /// Thrown from the `RawRepresentable` extension when
    /// `init(rawValue:)` returned `nil`.
    case rawRepresentableInitializationError(rawValue: Any, Metadata)
    
    /// When an error is thrown that isn't `DecodingError`, it 
    /// will be wrapped in `DecodingError.other` in order to also provide
    /// metadata about where the error was thrown.
    case other(Error, Metadata)
    
    public var metadata: Metadata {
        get {
            switch self {
            case .typeMismatch(expected: _, actual: _, let metadata):
                return metadata
            case .missingKey(_, let metadata):
                return metadata
            case .rawRepresentableInitializationError(_, let metadata):
                return metadata
            case .other(_, let metadata):
                return metadata
            }
        }
        
        set {
            switch self {
            case let .typeMismatch(expected, actual, _):
                self = .typeMismatch(expected: expected, actual: actual, newValue)
            case let .missingKey(key, _):
                self = .missingKey(key, newValue)
            case let .rawRepresentableInitializationError(rawValue, _):
                self = DecodingError.rawRepresentableInitializationError(rawValue: rawValue, newValue)
            case let .other(error, _):
                self = .other(error, newValue)
            }
        }

    }
    
    public var debugDescription: String {
        switch self {
        case let .typeMismatch(expected, actual, metadata):
            return "typeMismatch expected: \(expected) but \(metadata.object) is of type \(actual) in \(metadata.formattedPath)"
        case let .missingKey(key, metadata):
            return "missingKey \(key) in \(metadata.formattedPath) \(metadata.object)"
        case let .rawRepresentableInitializationError(rawValue, metadata):
            return "rawRepresentableInitializationError: \(rawValue) could not be used to initialize \("TYPE"). (path: \(metadata.formattedPath))" // FIXME
        case let .other(error, _):
            return "\(error)"
        }
    }
    
}


// Allow types to be used in pattern matching
// E.g case typeMismatchError(NSNull.self, _, _) but be careful
// You probably rather want to modify the decode-closure
// There are overloads for this
public func ~=<T>(lhs: T.Type, rhs: Any.Type) -> Bool {
    return lhs == rhs
}

// FIXME: I'm not sure about === equality
public func ==(lhs: DecodingError.Metadata, rhs: DecodingError.Metadata) -> Bool {
    return lhs.object as AnyObject === rhs.object as AnyObject
        && lhs.path == rhs.path
        && lhs.rootObject  as AnyObject === rhs.rootObject as AnyObject
}

public func ==(lhs: DecodingError, rhs: DecodingError) -> Bool {
    switch (lhs, rhs) {
    case let (.typeMismatch(expected, actual, metadata), .typeMismatch(expected2, actual2, metadata2)):
        return expected == expected2
            && actual == actual2
            && metadata == metadata2
    case let (.missingKey(key, metadata), .missingKey(key2, metadata2)):
        return key == key2
            && metadata == metadata2
    case let (.rawRepresentableInitializationError(rawValue, metadata), .rawRepresentableInitializationError(rawValue2, metadata2)):
        // FIXME: Might be strange
        switch (rawValue, rawValue2, metadata == metadata2) {
        case let (a as AnyObject, b as AnyObject, true):
            return a === b
        default:
            return false
        }
    case (.other, .other):
        // FIXME: What to do?
        print("FIXME: other equality is unimplemented/not supported")
        return false
    default:
        return false
    }
}

