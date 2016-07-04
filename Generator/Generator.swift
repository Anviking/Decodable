#!/usr/bin/xcrun --sdk macosx swift

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
    var names = Array(["A", "B", "C", "D", "E", "F", "G"].reversed())
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

indirect enum Decodable {
    case T(Unique)
    //    case AnyObject
    case Array(Decodable)
    case Optional(Decodable)
//    case Dictionary(Decodable, Decodable)
    
    func decodeClosure(_ provider: TypeNameProvider) -> String {
        switch self {
        case T(let key):
            return "\(provider[key]).decode"
            //        case .AnyObject:
        //            return "{$0}"
        case Optional(let T):
            return "catchNull(\(T.decodeClosure(provider)))"
        case Array(let T):
            return "decodeArray(\(T.decodeClosure(provider)))"
//        case .Dictionary(let K, let T):
//            return "decodeDictionary(\(K.decodeClosure(provider)), elementDecodeClosure: \(T.decodeClosure(provider)))"
        }
    }
    
    func typeString(_ provider: TypeNameProvider) -> String {
        switch self {
        case .T(let unique):
            return provider[unique]
        case Optional(let T):
            return "\(T.typeString(provider))?"
        case Array(let T):
            return "[\(T.typeString(provider))]"
//        case .Dictionary(let K, let T):
//            return "[\(K.typeString(provider)): \(T.typeString(provider))]"
        }
    }
    
    func generateAllPossibleChildren(_ deepness: Int) -> [Decodable] {
        guard deepness > 0 else { return [.T(Unique())] }
        
        var array = [Decodable]()
        array += generateAllPossibleChildren(deepness - 1).flatMap(filterChainedOptionals)
        array += generateAllPossibleChildren(deepness - 1).map { .Array($0) }
//        array += generateAllPossibleChildren(deepness - 1).map { .Dictionary(.T(Unique()),$0) }
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
    
    func generateOverloads(_ operatorString: String, lhsIsAnyObject: Bool = false) -> [String] {
        let provider = TypeNameProvider()
        let returnType: String
        let parseCallString: String
        let behaviour: Behaviour
        let parseEndString: String
        switch operatorString {
        case "=>":
            returnType = typeString(provider)
            behaviour = Behaviour(throwsIfKeyMissing: true, throwsIfNull: !isOptional, throwsFromDecodeClosure: true)
            parseCallString = "    let object = try context.parse("
            parseEndString = ")\n"
        case "=>?":
            returnType = typeString(provider) + "?"
            behaviour = Behaviour(throwsIfKeyMissing: false, throwsIfNull: !isOptional, throwsFromDecodeClosure: true)
            parseCallString = "    guard let object = try context.parseAndAcceptMissingKeys("
            parseEndString = ") else { return nil }\n"
        default:
            fatalError()
        }
        
        let arguments = provider.takenNames.values.sorted().map { $0 + ": Decodable" }
        
        let constraints = lhsIsAnyObject ? " where A.Parameters == Void" : ""
        
		let generics = arguments.count > 0 ? "<\(arguments.joined(separator: ", "))\(constraints)>" : ""
        
        let documentation = generateDocumentationComment(behaviour)
        let throwKeyword =  "throws"
        
        let lhs: String
        let createContextIfNeeded: String
        if lhsIsAnyObject {
            lhs = "json: AnyObject"
            createContextIfNeeded = "    let context = DecodingContext<Void>(json: json, path: [], rootObject: json, parameters: ())\n"
        } else {
            lhs = "context: DecodingContext<A.Parameters>"
            createContextIfNeeded = ""
        }
        
        return [documentation + "public func \(operatorString) \(generics)(\(lhs), path: String)\(throwKeyword) -> \(returnType) {\n" +
            createContextIfNeeded +
            "    let decode = \(decodeClosure(provider))\n" +
            parseCallString + "keys: [path]" + parseEndString +
            "    return try decode(object)\n" +
            "}", documentation + "public func \(operatorString) \(generics)(\(lhs), path: [String])\(throwKeyword) -> \(returnType) {\n" +
                createContextIfNeeded +
                "    let decode = \(decodeClosure(provider))\n" +
                parseCallString + "keys: path" + parseEndString +
                "    return try decode(object)\n" +
            "}"
        ]
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

func generateDocumentationComment(_ behaviour: Behaviour) -> String {
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
let fileManager = FileManager.default()
let sourcesDirectory = fileManager.currentDirectoryPath + "/../Sources"


let filename = "Overloads.swift"
let path = sourcesDirectory + "/" + filename

var dateFormatter = DateFormatter()
dateFormatter.dateStyle = .shortStyle

let date = dateFormatter.string(from: Date())

let overloads = Decodable.T(Unique()).generateAllPossibleChildren(3)
let types = overloads.map { $0.typeString(TypeNameProvider()) }
let all = overloads.flatMap { $0.generateOverloads("=>") } + overloads.flatMap(filterOptionals).flatMap { $0.generateOverloads("=>?") } + overloads.flatMap { $0.generateOverloads("=>", lhsIsAnyObject: true) } + overloads.flatMap(filterOptionals).flatMap { $0.generateOverloads("=>?", lhsIsAnyObject: true) }

do {
    var template = try String(contentsOfFile: fileManager.currentDirectoryPath + "/Template.swift") as NSString
	template = template.replacingOccurrences(of: "{filename}", with: filename)
	template = template.replacingOccurrences(of: "{by}", with: "Generator.swift")
	template = template.replacingOccurrences(of: "{overloads}", with: types.joined(separator: ", "))
    template = template.replacingOccurrences(of: "{count}", with: "\(all.count)")
	let text = (template as String) + "\n" + all.joined(separator: "\n\n")
	try text.write(toFile: sourcesDirectory + "/Overloads.swift", atomically: false, encoding: String.Encoding.utf8)
}
catch {
    print(error)
}
