//: Playground - noun: a place where people can play

import UIKit

public protocol Decodable {
    static func decode(json: AnyObject) throws -> Self
}

public protocol MetaDecodable {
    typealias MetaType
    var objects: MetaType {get}
    static func decode(json: AnyObject, type: Decodable.Type) throws -> MetaType
}

public protocol Castable: Decodable {}

extension Castable {
    public static func decode(j: AnyObject) throws -> Self {
        guard let result = j as? Self else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}

extension Int: Castable {}

extension NSDictionary {
    public static func decode(j: AnyObject) throws -> NSDictionary {
        guard let result = j as? NSDictionary else {
            let info = DecodingError.Info(object: j)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        return result
    }
}


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
            return ".".join(path)
        }
    }
    
    case MissingKey(key: String, info: Info)
    case TypeMismatch(type: Any.Type, info: Info)
    
    var info: Info {
        get {
            switch self {
            case MissingKey(key: _, let info):
                return info
            case TypeMismatch(_, let info):
                return info
            }
        }
        set {
            switch self {
            case MissingKey(let key, _):
                self = MissingKey(key: key, info: newValue)
            case TypeMismatch(let type, _):
                self = TypeMismatch(type: type, info: newValue)
            }
        }
    }
    
    public var debugDescription: String {
        switch self {
        case .MissingKey(let key, let info):
            return "Missing Key \(key) in \(info.formattedPath) \(info.object)"
        case .TypeMismatch(let type, let info):
            return "TypeMismatch \(info.formattedPath) type: \(type), object: \(info.object)"
        }
    }
}


private func parseToAnyObject(json: AnyObject, path: [String]) throws -> AnyObject {
    
    func objectForKey(dictionary: NSDictionary, key: String) throws -> AnyObject {
        guard let result = dictionary[key] else {
            let info = DecodingError.Info(object: dictionary)
            throw DecodingError.MissingKey(key: key, info: info)
        }
        return result
    }
    
    guard let lastKey = path.last else {
        return json
    }
    var path = path
    path.removeLast()
    
    var currentDict = try NSDictionary.decode(json)
    for key in path {
        currentDict = try NSDictionary.decode(objectForKey(currentDict, key: key))
    }
    
    return try objectForKey(currentDict, key: lastKey)
}


func parse<T: Decodable>(json: AnyObject, path: String...) throws -> T {
    return try T.decode(parseToAnyObject(json, path: path))
}

func parse<T: Decodable>(json: AnyObject, path: String...) throws -> T? {
    return try T.decode(parseToAnyObject(json, path: path))
}

infix operator => { associativity right precedence 150 }

func => <T: Decodable>(lhs: AnyObject, rhs: JSONPath) throws -> T {
    return try T.decode(parseToAnyObject(lhs, path: rhs.path))
}



func => (lhs: String, rhs: JSONPath) throws -> JSONPath {
    return JSONPath(path: [lhs] + rhs.path)
}

struct JSONPath: StringLiteralConvertible {
    
    let path: [String]
    
    typealias ExtendedGraphemeClusterLiteralType = String
    typealias UnicodeScalarLiteralType = String
    
    init(path: [String]) {
        self.path = path
    }
    
    init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        self.path = [value]
    }
    
    init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        self.path = [value]
    }
    
    init(stringLiteral value: StringLiteralType) {
        self.path = [value]
    }
}

let a: AnyObject = ["test": ["key": 3]]
try! parse(a, path: "test", "key") as Int?
try! a => "test" => "key" as Int
