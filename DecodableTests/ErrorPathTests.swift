//
//  ErrorPathTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-16.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

private struct Color: Decodable {
    let name: String
    
    private static func decode(json: AnyObject) throws -> Color {
        return try Color(name: json => "name")
    }
}

private struct Apple: Decodable {
    let id: Int
    let color: Color?
    
    private static func decode(json: AnyObject) throws -> Apple {
        return try Apple(id: json => "id", color: json => "color")
    }
}

private struct Tree: Decodable {
    let apples: [Apple]
    
    private static func decode(json: AnyObject) throws -> Tree {
        return try Tree(apples: json => "apples")
    }
}

class ErrorPathTests: XCTestCase {
    
    func testMissingKeyErrorPath() {
        
        let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": "anviking"]]]]
        
        do {
            try dict => "object" => "repo" => "owner" => "oops" as String
        } catch DecodingError.MissingKey(_, let info) {
            XCTAssertEqual(info.formattedPath, "object.repo.owner")
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
    // FIXME: #
    func testNestedUnexpectedNSNull() {
        let dict: NSDictionary = ["id": 1, "color": ["name": NSNull()]]
        do {
            let apple = try Apple.decode(dict)
            print(apple)
            XCTFail()
        } catch DecodingError.TypeMismatch(NSNull.self, _, _) {
            
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
    func testTypeMismatchErrorPath() {
        
        let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": 0]]]]
        
        do {
            try dict => "object" => "repo" => "owner" => "login" as String
        } catch DecodingError.TypeMismatch(let type, String.self, let info) {
            XCTAssertEqual(String(type), "__NSCFNumber")
            XCTAssertEqual(info.formattedPath, "object.repo.owner.login")
            XCTAssertEqual(info.object as? Int, 0)
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
    func testNestedObjectTypeMismatchPath() {
        let dict: NSDictionary = ["apples": [["id": 2, "color": ["name": "red"]],
            ["id": 2, "color": ["name": "green"]],
            ["id": 2, "color": ["name": 3]]]]
        do {
            try Tree.decode(dict)
            XCTFail()
        } catch DecodingError.TypeMismatch(let type, String.self, let info) {
            XCTAssertEqual(String(type), "__NSCFNumber")
            XCTAssertEqual(info.formattedPath, "apples.color.name")
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
    
    func testFoo() {
        let dictionary: NSDictionary = ["key": ["test": 3]]
        let a: Int = try! uppercase(dictionary => "key") as AnyObject => "TEST"
        XCTAssertEqual(a, 3)
    }
    
    private func uppercase(json: NSDictionary) -> NSDictionary {
        var result = [String: AnyObject]()
        for (key, value) in json {
            result[key.uppercaseString] = value
        }
        print(result)
        return result
    }
    
}
