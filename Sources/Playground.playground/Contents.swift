//: Playground - noun: a place where people can play
import Foundation

extension NSDictionary {
    public static func decode(_ j: AnyObject) throws -> NSDictionary {
        guard let result = j as? NSDictionary else {
            throw TypeMismatchError(expectedType: self, receivedType: j.dynamicType, object: j)
        }
        return result
    }
}

public struct DecodingContext<T> {
    var path: [String]
    var json: AnyObject
    var rootObject: AnyObject
    var parameters: T
    
    init(json: AnyObject, path: [String] = [], rootObject: AnyObject, parameters: T) {
        self.json = json
        self.path = path
        self.rootObject = rootObject
        self.parameters = parameters
    }
    
    public func parse(key: String) throws -> DecodingContext {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            throw MissingKeyError(key: key, object: json)
        }
        
        var new = self
        new.json = obj
        return new
    }
    
    public func parse(keys: [String]) throws -> DecodingContext {
        return try keys.reduce(self) { try $0.0.parse(key: $0.1) }
    }
    
    public func parseAndAcceptMissingKey(key: String) throws -> DecodingContext? {
        let dict = try NSDictionary.decode(json)
        guard let obj = dict[key] else {
            throw MissingKeyError(key: key, object: json)
        }
        
        return with(json: obj)
    }
    
    public func parseAndAcceptMissingKeys(keys: [String]) throws -> DecodingContext? {
        return try keys.reduce(self) { try $0.0?.parseAndAcceptMissingKey(key: $0.1) }
    }
    
    public func with(json: AnyObject) -> DecodingContext {
        var new = self
        new.json = json
        return new
    }
    
    func map<U>(closure: (T) -> U) -> DecodingContext<U> {
        return DecodingContext<U>(json: json, path: path, rootObject: rootObject, parameters: closure(parameters))
    }
}

let dict: NSDictionary = ["hello": "world"]
let response = "<this is a urlresponse>"
let code = 200

let a = DecodingContext(json: dict, path: [], rootObject: dict, parameters: (urlResponse: response, code: code))
let params = a.parameters.urlResponse

let b = a.map {
    (urlResponse: $0.urlResponse, code: $0.code, additionalParamter: true)
}

b.parameters.additionalParamter


//
public protocol Decodable {
    associatedtype Parameters = Void
    static func decode(_ : DecodingContext<Parameters>) throws -> Self
}
//

/*
class A: Decodable {
    var b: B!
    
    static func decode(_ context: DecodingContext<Void>) throws -> Self {
        let a = A()
        let context = context.map { a }
        a.b = context => ""
    }
}

class B: Decodable {
    weak var a: A?
    let urlResponse: String = ""
    
    required init(context: DecodingContext<A>) {
        a = context.parameters
        //urlResponse = context => "urlResponse"
    }
    
    static func decode(_ context: DecodingContext<A>) throws -> Self {
        return Self.init(context: context)
    }
}

*/

