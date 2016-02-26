//: Playground - noun: a place where people can play

// If you want to ignore changes in this playground:
// git update-index --assume-unchanged Decodable/Playground.playground/Contents.swift

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
        array += generateAllPossibleChildren(deepness - 1).map { .Optional($0) }
        array += generateAllPossibleChildren(deepness - 1).map { .Array($0) }
        array += generateAllPossibleChildren(deepness - 1).map { .Dictionary(.T(Unique()),$0) }
        array += [.T(Unique())]
        return array
    }
}

let a = Decodable.T(Unique()).generateAllPossibleChildren(2).map { type in
    let provider = TypeNameProvider()
    let returnType = type.typeString(provider)
    let arguments = provider.takenNames.values.sort().map { $0 + ": Decodable" }
    let generics = arguments.count > 0 ? "<\(arguments.joinWithSeparator(", "))>" : ""
    return  "public func => \(generics)(json: AnyObject, path: String) throws -> \(returnType) {\n" +
            "    return try parse(json, path: path, decode: \(type.decodeClosure(provider)))\n" +
            "}"
}.joinWithSeparator("\n")
    
print(a) 













