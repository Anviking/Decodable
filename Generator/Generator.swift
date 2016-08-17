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

// ----------------------------------------------------------------------------------------
// MARK: Documentation
// ----------------------------------------------------------------------------------------

struct Behaviour {
    let throwsIfKeyMissing: Bool
    let throwsIfNull: Bool
    let throwsFromDecodeClosure: Bool
}


let fileManager = FileManager.default
let documentationTemplate = try String(contentsOfFile: fileManager.currentDirectoryPath + "/Templates/Documentation.swift")

func documentationFromTemplate(path: String, throwsIf: String, returns: String) -> String {
    return documentationTemplate
        .replacingOccurrences(of: "{path}", with: path)
        .replacingOccurrences(of: "{throws}", with: throwsIf)
        .replacingOccurrences(of: "{returns}", with: returns)
}

func generateDocumentationComment(_ behaviour: Behaviour) -> String {
    switch (behaviour.throwsIfKeyMissing, behaviour.throwsIfNull) {
    case (true, true):
        return documentationFromTemplate(
            path: "`KeyPath`– can be appended using with `=>` or `=>?`",
            throwsIf: "`DecodingError.typeMismatchError`,`.other(error, metadata)` or possible `.missingKeyError` on required keys",
            returns: "something"
        )
    case (true, false):
        return documentationFromTemplate(
            path: "`KeyPath`– can be appended using with `=>` or `=>?`",
            throwsIf: "`DecodingError` if a key is missing or decoding fails.",
            returns: "`nil` if the object at `path` is `NSNull`"
            )
    case (false, false):
        return documentationFromTemplate(
            path: "`KeyPath`– can be appended using with `=>` or `=>?`",
            throwsIf: "`DecodingError.typeMismatch, `.other(error, metadata)` or possible `.missingKeyError` on required keys",
            returns: "`nil` if the object at `path` is `NSNull` or if any optional key is missing."
        )
    case (false, true):
        fatalError("This case should never happen, right?")
    }
}

// ----------------------------------------------------------------------------------------
// MARK:
// ----------------------------------------------------------------------------------------


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
    case Dictionary(Decodable, Decodable)
    
    func decodeClosure(_ provider: TypeNameProvider) -> String {
        switch self {
        case .T(let key):
            return "\(provider[key]).decode"
            //        case .AnyObject:
        //            return "{$0}"
        case .Optional(let T):
            return "Optional.decoder(\(T.decodeClosure(provider)))"
        case .Array(let T):
            return "Array.decoder(\(T.decodeClosure(provider)))"
        case .Dictionary(let K, let T):
            return "Dictionary.decoder(key: \(K.decodeClosure(provider)), value: \(T.decodeClosure(provider)))"
        }
    }
    
    func typeString(_ provider: TypeNameProvider) -> String {
        switch self {
        case .T(let unique):
            return provider[unique]
        case .Optional(let T):
            return "\(T.typeString(provider))?"
        case .Array(let T):
            return "[\(T.typeString(provider))]"
        case .Dictionary(let K, let T):
            return "[\(K.typeString(provider)): \(T.typeString(provider))]"
        }
    }
    
    func generateAllPossibleChildren(_ deepness: Int) -> [Decodable] {
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
    
    func generateOverloads(_ operatorString: String) -> [String] {
        let provider = TypeNameProvider()
        let behaviour: Behaviour
        let keyPathType: String
        
        let returnType = typeString(provider)
        let overloads = [String]()
        
        let arguments = provider.takenNames.values.sorted().map { $0 + ": Decodable" }
        let generics = arguments.count > 0 ? "<\(arguments.joined(separator: ", "))>" : ""
        
        switch operatorString {
        case "=>":
            behaviour = Behaviour(throwsIfKeyMissing: true, throwsIfNull: !isOptional, throwsFromDecodeClosure: true)
            keyPathType = "KeyPath"
            
            /*
            // Start again
            guard isOptional else { break }
            let otherBehaviour = Behaviour(throwsIfKeyMissing: false, throwsIfNull: !isOptional, throwsFromDecodeClosure: true)
            let documentation = generateDocumentationComment(otherBehaviour)
            overloads.append(documentation + "public func \(operatorString) \(generics)(json: AnyObject, keyPath: OptionalKeyPath) throws -> \(returnType) {\n" +
                "    return try parse(json, keyPath: keyPath.markingFirst(required: true), decode: \(decodeClosure(provider)))\n" +
                "}"
            )
 */
            
        case "=>?":
            //returnType += "?"
            // Never trows if null
            behaviour = Behaviour(throwsIfKeyMissing: false, throwsIfNull: false, throwsFromDecodeClosure: true)
            keyPathType = "OptionalKeyPath"
        default:
            fatalError()
        }
        
        let documentation = generateDocumentationComment(behaviour)
        return overloads + [documentation + "public func \(operatorString) \(generics)(json: Any, keyPath: \(keyPathType)) throws -> \(returnType) {\n" +
            "    return try parse(json, keyPath: keyPath, decoder: \(decodeClosure(provider)))\n" +
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


let file = "Overloads.swift"
let sourcesDirectory = fileManager.currentDirectoryPath + "/../Sources"


let filename = "Overloads.swift"
let path = sourcesDirectory + "/" + filename

var dateFormatter = DateFormatter()
dateFormatter.dateStyle = .short

let date = dateFormatter.string(from: Date())

let overloads = Decodable.T(Unique()).generateAllPossibleChildren(4)
let types = overloads.map { $0.typeString(TypeNameProvider()) }
let all = overloads.flatMap { $0.generateOverloads("=>") } + overloads.flatMap(filterOptionals).map{ $0.wrapInOptionalIfNeeded() }.flatMap { $0.generateOverloads("=>?") }

do {
    var template = try String(contentsOfFile: fileManager.currentDirectoryPath + "/Templates/Header.swift")
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
