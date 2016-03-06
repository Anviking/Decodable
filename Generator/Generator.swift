//
//  Generator.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-27.
//  Copyright © 2016 anviking. All rights reserved.
//

// For generating overloads

import Foundation

class TypeNameProvider {
    var names = Array(["A", "B", "C", "D", "E", "F", "G"].reverse())
    var takenNames: [Unique: String] = [:]
    subscript(key: Unique) -> String {
        if let name = takenNames[key] {
            return name
        }
        
        let n = names.popLast()!
        takenNames[key] = n
        return n
    }
    
}

struct Unique: Hashable, Equatable {
    static var counter = 0
    let value: Int
    init() {
        Unique.counter += 1
        value = Unique.counter
    }
    var hashValue: Int {
        return value.hashValue
    }
}

func == (a: Unique, b: Unique) -> Bool {
    return a.value == b.value
}

struct Overload: CustomStringConvertible {
    let operatorString: String
    let returnType: Decodable
    let rhs: (type: String, call: String)
    let parseCall: String
    
    var description: String {
        let provider = TypeNameProvider()
        let type = returnType.typeString(provider)
        let arguments = provider.takenNames.values.sort().map { $0 + ": Decodable" }
        let generics = arguments.count > 0 ? "<\(arguments.joinWithSeparator(", "))>" : ""
        return [
            documentation,
            "public func \(operatorString) \(generics)(json: AnyObject, path: \(rhs.type)) throws -> \(type) {",
            "return try \(parseCall)(json, path: \(rhs.call), decode: \(returnType.decodeClosure(provider)))",
            "}"
            ].joinWithSeparator("\n")
    }
    
    var documentation: String {
        var string =
            "/**\n" +
                " Retrieves the object at `path` from `json` and decodes it according to the return type\n" +
                "\n" +
                " - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.\n" +
        " - parameter path: A null-separated key-path string. Can be generated with `\"keyA\" => \"keyB\"`\n"
        switch (returnType.isOptional, operatorString == "=>?") {
        case (true, true):
            string += " - Returns: nil if the pre-decoded object at `path` is `NSNull`.\n"
            string += " - Throws: `TypeMismatchError` or any other error thrown in the decode-closure.\n"
        case (true, false):
            string += " - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.\n"
            string += " - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.\n"
        case (false, true):
            fatalError()
        case (false, false):
            string += " - Returns: A non-optional object, meaning `null` values will most likely cause the decode-closure to throw.\n"
            string += " - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure.\n"
        }
        return string + "*/\n"
    }
}

enum OverloadParameters {
    case String
    case OptionalPath
    case NonOptionalPath
}

enum OverloadType: String {
    case Throwing = "=>"
    case Optional = "=>?"
    
    var parseCall: String {
        switch self {
        case .Throwing:
            return "parse"
        case .Optional:
            return "parseOptionally"
        }
    }
}

indirect enum Decodable {
    case T(Unique)
    case Array(Decodable)
    case Optional(Decodable)
    case Dictionary(Decodable, Decodable)
    
    func decodeClosure(provider: TypeNameProvider) -> String {
        switch self {
        case T(let key):
            return "\(provider[key]).decode"
        case Optional(let T):
            return "catchNull(\(T.decodeClosure(provider)))"
        case Array(let T):
            return "decodeArray(\(T.decodeClosure(provider)))"
        case .Dictionary(let K, let T):
            return "decodeDictionary(\(K.decodeClosure(provider)), elementDecodeClosure: \(T.decodeClosure(provider)))"
        }
    }
    
    func typeString(provider: TypeNameProvider) -> String {
        switch self {
        case .T(let unique):
            return provider[unique]
        case Optional(let T):
            return "\(T.typeString(provider))?"
        case Array(let T):
            return "[\(T.typeString(provider))]"
        case .Dictionary(let K, let T):
            return "[\(K.typeString(provider)): \(T.typeString(provider))]"
        }
    }
    
    func generateAllPossibleChildren(deepness: Int) -> [Decodable] {
        guard deepness > 0 else { return [.T(Unique())] }
        
        var array = [Decodable]()
        array += generateAllPossibleChildren(deepness - 1).flatMap(filterChainedOptionals)
        array += generateAllPossibleChildren(deepness - 1).map { .Array($0) }
        array += generateAllPossibleChildren(deepness - 1).map { .Dictionary(.T(Unique()),$0) }
        array += [.T(Unique())]
        return array
    }
    
    func wrapInOptionalIfNeeded() -> Decodable {
        switch self {
        case .Optional:
            return self
        default:
            return .Optional(self)
        }
    }
    
    var isOptional: Bool {
        switch self {
        case .Optional:
            return true
        default:
            return false
        }
    }
    
    func generateOverloads(operatorString: String) -> [String] {
        
        let shouldConvertToOptional = operatorString == "=>?"        
        var overloads = [Overload]()
        
        if isOptional == shouldConvertToOptional {
            overloads.append(Overload(operatorString: "=>", returnType: self, rhs: (type: "String", call: "[Key(key: path)]"), parseCall: "parse"))
        }
        
        switch (isOptional, shouldConvertToOptional) {
        case (true, true):
            overloads.append(Overload(operatorString: "=>?", returnType: self, rhs: (type: "[Key]", call: "path.markFirstElement(true)"), parseCall: "parseOptionally"))
            overloads.append(Overload(operatorString: "=>?", returnType: self, rhs: (type: "String", call: "[OptionalKey(key: path, optional: true)]"), parseCall: "parseOptionally"))
            overloads.append(Overload(operatorString: "=>?", returnType: self, rhs: (type: "[OptionalKey]", call: "path.markFirstElement(true)"), parseCall: "parseOptionally"))
        case (true, false):
            overloads.append(Overload(operatorString: "=>", returnType: self, rhs: (type: "[Key]", call: "path"), parseCall: "parse"))
            overloads.append(Overload(operatorString: "=>", returnType: self, rhs: (type: "[OptionalKey]", call: "path.markFirstElement(false)"), parseCall: "parseOptionally"))
        case (false, false):
            overloads.append(Overload(operatorString: "=>", returnType: self, rhs: (type: "[Key]", call: "path"), parseCall: "parse"))
        default:
            break
        }
        return overloads.map {$0.description}
    }
}

func filterChainedOptionals(type: Decodable) -> Decodable? {
    switch type {
    case .Optional:
        return nil
    default:
        return .Optional(type)
    }
}

func filterOptionals(type: Decodable) -> Decodable? {
    switch type {
    case .Optional:
        return nil
    default:
        return type
    }
}

struct Behaviour {
    let throwsIfKeyMissing: Bool
    let throwsIfNull: Bool
    let throwsFromDecodeClosure: Bool
}

func generateDocumentationComment(behaviour: Behaviour) -> String {
    var string =
        "/**\n" +
            " Retrieves the object at `path` from `json` and decodes it according to the return type\n" +
            "\n" +
            " - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.\n" +
    " - parameter path: A null-separated key-path string. Can be generated with `\"keyA\" => \"keyB\"`\n"
    switch (behaviour.throwsIfKeyMissing, behaviour.throwsIfNull) {
    case (true, true):
        string += " - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure\n"
    case (true, false):
        string += " - Returns: nil if the pre-decoded object at `path` is `NSNull`.\n"
        string += " - Throws: `MissingKeyError` if `path` does not exist in `json`. `TypeMismatchError` or any other error thrown in the decode-closure\n"
    case (false, false):
        string += " - Returns: nil if `path` does not exist in `json`, or if that object is `NSNull`.\n"
        string += " - Throws: `TypeMismatchError` or any other error thrown in the decode-closure\n"
    case (false, true):
        break
    }
    return string + "*/\n"
}

let file = "Overloads.swift"
let fileManager = NSFileManager.defaultManager()
let sourcesDirectory = fileManager.currentDirectoryPath + "/../Sources"


let filename = "Overloads.swift"

let dateFormatter = NSDateFormatter()
dateFormatter.dateStyle = .ShortStyle

let date = dateFormatter.stringFromDate(NSDate())

let overloads = Decodable.T(Unique()).generateAllPossibleChildren(3)
let types = overloads.map { $0.typeString(TypeNameProvider()) }
let all = overloads.flatMap { $0.generateOverloads("=>") + $0.generateOverloads("=>?") }

do {
    var template = try String(contentsOfFile: fileManager.currentDirectoryPath + "/Template.swift")
    template = template.stringByReplacingOccurrencesOfString("{filename}", withString: filename)
    template = template.stringByReplacingOccurrencesOfString("{by}", withString: "Generator.swift")
    template = template.stringByReplacingOccurrencesOfString("{overloads}", withString: types.joinWithSeparator(", "))
    template = template.stringByReplacingOccurrencesOfString("{count}", withString: "\(all.count)")
    let text = template + "\n" + all.joinWithSeparator("\n\n")
    try text.writeToFile(sourcesDirectory + "/Overloads.swift", atomically: false, encoding: NSUTF8StringEncoding)
}
catch {
    print(error)
}
