//
//  DecodingError.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-17.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation



public enum DecodingError: ErrorType, CustomDebugStringConvertible {
    
    public struct Info {
        
        public init(object: AnyObject, rootObject: AnyObject? = nil, path: [String] = []) {
            self.object = object
            self.rootObject = rootObject
            self.path = path
        }
        
        var path: [String]
        var object: AnyObject?
        var rootObject: AnyObject?
        
        var formattedPath: String {
            return path.joinWithSeparator(".")
        }
    }
    
    case MissingKey(key: String, info: Info)
    case TypeMismatch(type: Any.Type, expectedType: Any.Type, info: Info)
    
    var info: Info {
        get {
            switch self {
            case MissingKey(key: _, let info):
                return info
            case TypeMismatch(_, _, let info):
                return info
            }
        }
        set {
            switch self {
            case MissingKey(let key, _):
                self = MissingKey(key: key, info: newValue)
            case TypeMismatch(let type, let expectedType, _):
                self = TypeMismatch(type: type, expectedType: expectedType, info: newValue)
            }
        }
    }
    
    public var debugDescription: String {
        switch self {
        case .MissingKey(let key, let info):
            return "Missing Key \(key) in \(info.formattedPath) \(info.object)"
        case .TypeMismatch(let type, let expectedType, let info):
            return "TypeMismatch \(type), expected: \(expectedType) in \(info.formattedPath) object: \(info.object)"
        }
    }
}
