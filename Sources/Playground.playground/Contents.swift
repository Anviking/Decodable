//: Playground - noun: a place where people can play

// If you want to ignore changes in this playground:
// git update-index --assume-unchanged Decodable/Playground.playground/Contents.swift

import UIKit
import Decodable

public protocol Transformable: Decodable {
    typealias RawDecodableType: Decodable
    static func transform(rawValue: RawDecodableType) throws -> Self?
}

extension Transformable {
    public static func decode(json: AnyObject) throws -> Self {
        let rawValue = try RawDecodableType.decode(json)
        guard let value = try tras
        return try transform()
    }
}


struct WrappedError: ErrorType {
    let code: Int
    let error: ErrorType
}

enum Error: ErrorType {
    case InvalidWorld
    case BrokenSea
}

do {
    throw WrappedError(code: 404, error: Error.BrokenSea)
} catch let error as WrappedError where error.code == 404 {
    print("test")
}









