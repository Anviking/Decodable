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

indirect enum Decodable {
    case T(Unique)
    //    case AnyObject
    case Array(Decodable)
    case Optional(Decodable)
    case Dictionary(Decodable, Decodable)
    
    func decodeClosure(provider: TypeNameProvider) -> String {
        switch self {
        case T(let key):
            return "\(provider[key]).decode"
            //        case .AnyObject:
        //            return "{$0}"
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
            //        case .AnyObject:
            //            return "AnyObject"
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
    
    var doesThrow: Bool {
        switch self {
        case .Optional:
            return true
        default:
            return false
        }
    }
    
    func generateOverload(operatorString: String) -> String {
        let provider = TypeNameProvider()
        let returnType: String
        let parseCallString: String
        let behaviour: Behaviour
        
        switch operatorString {
        case "=>":
            returnType = typeString(provider)
            behaviour = Behaviour(throwsIfKeyMissing: true, throwsFromDecodeClosure: true)
            parseCallString = "parse"
        case "=>?":
            returnType = typeString(provider) + "?"
            behaviour = Behaviour(throwsIfKeyMissing: false, throwsFromDecodeClosure: true)
            parseCallString = "parseAndAcceptMissingKey"
        default:
            fatalError()
        }
        
        let arguments = provider.takenNames.values.sort().map { $0 + ": Decodable" }
        let generics = arguments.count > 0 ? "<\(arguments.joinWithSeparator(", "))>" : ""
        
        let documentation = generateDocumentationComment(behaviour)
        let throwKeyword =  behaviour.doesThrow ? " throws " : " "
        return  documentation + "public func \(operatorString) \(generics)(json: AnyObject, path: String)\(throwKeyword)-> \(returnType) {\n" +
            "    return try \(parseCallString)(json, path: path.toJSONPathArray(), decode: \(decodeClosure(provider)))\n" +
        "}"
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
    let throwsFromDecodeClosure: Bool
    var doesThrow: Bool { return throwsIfKeyMissing || throwsFromDecodeClosure }
}

func generateDocumentationComment(behaviour: Behaviour) -> String {
    var string =
        "/**\n" +
            " Retrieves the object at `path` from `json` and decodes it according to the return type\n" +
            "\n" +
            " - parameter json: An object from NSJSONSerialization, preferably a `NSDictionary`.\n" +
    " - parameter path: A null-separated key-path string. Can be generated with `\"keyA\" => \"keyB\"`\n"
    switch (behaviour.throwsIfKeyMissing, behaviour.throwsFromDecodeClosure) {
    case (true, true):
        string += " - Throws: `MissingKeyError` if `path` does not exist in `json`, or any error thrown in the decode closure.\n"
    case (true, false):
        string += " - Throws: `MissingKeyError` if `path` does not exist in `json`.\n"
    case (false, true):
        string += " - Throws: Rethrows errors thrown in the decode closure.\n"
    case (false, false):
        break
    }
    return string + "*/\n"
}

let file = "Overloads.swift"
let fileManager = NSFileManager.defaultManager()
let sourcesDirectory = fileManager.currentDirectoryPath + "/../Sources"


let filename = "Overloads.swift"
let path = sourcesDirectory + "/" + filename

let dateFormatter = NSDateFormatter()
dateFormatter.dateStyle = .ShortStyle

let date = dateFormatter.stringFromDate(NSDate())

let overloads = Decodable.T(Unique()).generateAllPossibleChildren(4)
let types = overloads.map { $0.typeString(TypeNameProvider()) }

do {
    var template = try String(contentsOfFile: fileManager.currentDirectoryPath + "/Template.swift")
    template = template.stringByReplacingOccurrencesOfString("{filename}", withString: filename)
    template = template.stringByReplacingOccurrencesOfString("{by}", withString: "Generator.swift")
    template = template.stringByReplacingOccurrencesOfString("{overloads}", withString: types.joinWithSeparator(", "))
    template = template.stringByReplacingOccurrencesOfString("{count}", withString: "\(types.count)")
    let all = overloads.map { $0.generateOverload("=>") } + overloads.flatMap(filterOptionals).map { $0.generateOverload("=>?") }
    let text = template + "\n" + all.joinWithSeparator("\n")
    try text.writeToFile(sourcesDirectory + "/Overloads.swift", atomically: false, encoding: NSUTF8StringEncoding)
}
catch {
    print(error)
}
