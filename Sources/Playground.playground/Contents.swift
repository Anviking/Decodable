//: Playground - noun: a place where people can play

import UIKit

extension NSDictionary {
    public static func decode(j: AnyObject) throws -> NSDictionary {
        guard let result = j as? NSDictionary else {
            fatalError()
        }
        return result
    }
}

infix operator => { associativity right precedence 150 }

func parse(object: AnyObject, key: String) throws -> AnyObject {
    return try NSDictionary.decode(object)[key]!
}

public func => (lhs: String, rhs: String) -> (AnyObject throws -> AnyObject) {
    return { json in
        return try parse(parse(json, key: lhs), key: rhs)
    }
}

public func => (lhs: String, rhs: (AnyObject throws -> AnyObject)) -> (AnyObject throws -> AnyObject) {
    return { json in
        return try rhs(parse(json, key: lhs))
    }
}

public func => (lhs: AnyObject, rhs: (AnyObject throws -> AnyObject)) throws -> AnyObject {
    return try rhs(lhs)
}

let dict: NSDictionary = ["a": ["b": 2]]

print(try! dict => "a" => "b")

indirect enum ParseAction {
    case AcceptNull(ParseAction)
    case Default(ParseAction)
    case Done
}