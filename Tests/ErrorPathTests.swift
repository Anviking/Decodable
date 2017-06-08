//
//  ErrorPathTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-16.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
import protocol Decodable.Decodable
import enum Decodable.DecodingError
@testable import Decodable

private struct Color: Decodable {
    let name: String
    
    static func decode(_ json: Any) throws -> Color {
        return try Color(name: json => "name")
    }
}

private struct Apple: Decodable {
    let id: Int
    let color: Color?
    
    static func decode(_ json: Any) throws -> Apple {
        return try Apple(id: json => "id", color: json => "color")
    }
}

private struct Tree: Decodable {
    let apples: [Apple]
    
    static func decode(_ json: Any) throws -> Tree {
        return try Tree(apples: json => "apples")
    }
}

class ErrorPathTests: XCTestCase {
    
    func testMissingKeyErrorPath() {
        
        let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": "anviking"]]]]
        
        do {
            _ = try dict => "object" => "repo" => "owner" => "oops" as String
        } catch DecodingError.missingKey(_ , let metadata) {
            XCTAssertEqual(metadata.formattedPath, "object.repo.owner")
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
        } catch DecodingError.typeMismatch(_, _, let metadata) where metadata.object is NSNull {
            
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
    func testTypeMismatchErrorPath() {
        
        let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": 0]]]]
        
        do {
            _ = try dict => "object" => "repo" => "owner" => "login" as String
        } catch let DecodingError.typeMismatch(_, actual, metadata) {
            let typeString = String(describing: actual)
            XCTAssertTrue(typeString.contains("Number"), "\(typeString) should contain NSNumber")
            XCTAssertEqual(metadata.formattedPath, "object.repo.owner.login")
            XCTAssertEqual(metadata.object as? Int, 0)
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
    func testNestedObjectTypeMismatchPath() {
        let dict: NSDictionary = ["apples": [["id": 2, "color": ["name": "red"]],
            ["id": 2, "color": ["name": "green"]],
            ["id": 2, "color": ["name": 3]]]]
        do {
            _ = try Tree.decode(dict)
            XCTFail()
        } catch let DecodingError.typeMismatch(_, actual, metadata) {
            XCTAssertTrue(String(describing: actual).contains("Number"))
            XCTAssertEqual(metadata.formattedPath, "apples.color.name")
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
    
    func testFoo() {
        let dictionary: NSDictionary = ["key": ["test": 3]]
        let a: Int = try! uppercase(dictionary => "key") => "TEST"
        XCTAssertEqual(a, 3)
    }
    
    private func uppercase(_ json: NSDictionary) -> NSDictionary {
        var result = [String: Any]()
        for (key, value) in json {
            result[(key as! String).uppercased()] = value
        }
        print(result)
        return result as NSDictionary
    }
    
}
