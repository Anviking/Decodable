//: Playground - noun: a place where people can play

// If you want to ignore changes in this playground:
// git update-index --assume-unchanged Decodable/Playground.playground/Contents.swift

import UIKit
import Decodable

struct Error: ErrorType {
}

public enum LKUserRole: String, Decodable {
    case Merchant = "merchant"
    case Admin = "admin"
    
    public static func decode(json: AnyObject) throws -> LKUserRole {
        let string = try String.decode(json)
        guard let role = LKUserRole(rawValue: string) else {
            throw Error()
        }
        return role
    }
    
}

var json: NSDictionary = ["roles": NSNull()]
var roles: [LKUserRole]? = try json => "roles"
var roles2 = (try json => "roles")?.map { LKUserRole(rawValue: $0)! }

json = ["roles": ["admin"]]
roles = try json => "roles"
roles2 = (try json => "roles")?.map { LKUserRole(rawValue: $0)! }

json = ["roles": []]
roles = try json => "roles"
roles2 = (try json => "roles")?.map { LKUserRole(rawValue: $0)! }

roles2


print(roles2)






