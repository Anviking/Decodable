//
//  DecodingError.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-17.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

/*
public enum DecodingError: ErrorType, CustomDebugStringConvertible {
    case MissingKey(path: [String], key: String, object: AnyObject)
    case TypeMismatch(path: [String], type: Any.Type, object: AnyObject)
    
    var path: [String] {
        get {
            switch self {
            case let .MissingKey(path: path, key: _, object: _):
                return path
            case let .TypeMismatch(path: path, type: _, object: _):
                return path
            }
        }
        set {
            switch self {
            case let .MissingKey(path: _, key: key, object: object):
                self = MissingKey(path: newValue, key: key, object: object)
            case let .TypeMismatch(path: _, type: type, object: object):
                self = .TypeMismatch(path: path, type: type, object: object)
            }
        }
    }
    
    
    public var debugDescription: String {
        switch self {
        case .MissingKey(let path, let key, let object):
            let path = ".".join(path)
            return "MissingKey at \(path): \(key) in \(object)"
        case .TypeMismatch(let path, let type, let object):
            let path = ".".join(path)
            return "TypeMismatch \(path) type: \(type), object: \(object)"
        }
    }
}
*/