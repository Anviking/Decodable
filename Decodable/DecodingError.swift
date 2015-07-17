//
//  DecodingError.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-17.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public enum DecodingError: ErrorType, CustomDebugStringConvertible {
    case MissingKey(key: String, object: AnyObject, path: [String])
    case TypeMismatch(type: Any.Type, object: AnyObject, path: [String])
    
    var path: [String] {
        get {
            switch self {
            case let .MissingKey(key: _, object: _, path: path):
                return path
            case let .TypeMismatch(type: _, object: _, path: path):
                return path
            }
        }
        set {
            switch self {
            case let .MissingKey(key: key, object: object, path: _):
                self = MissingKey(key: key, object: object, path: newValue)
            case let .TypeMismatch(type: type, object: object, path: _):
                self = .TypeMismatch(type: type, object: object, path: path)
            }
        }
    }
    
    var formattedPath: String {
        return ".".join(path)
    }
    
    
    public var debugDescription: String {
        switch self {
        case .MissingKey(let key, let object, _):
            return "Missing Key \(key) in \(formattedPath) \(object)"
        case .TypeMismatch(let type, let object, _):
            return "TypeMismatch \(formattedPath) type: \(type), object: \(object)"
        }
    }
}
