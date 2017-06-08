//
//  DictionaryTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-10-30.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
import protocol Decodable.Decodable
import enum Decodable.DecodingError
import Decodable

private struct Color: Decodable, Equatable {
    let name: String
    static func decode(_ json: Any) throws -> Color {
        return try Color(name: String.decode(json))
    }
    
    static func == (lhs: Color, rhs: Color) -> Bool {
        return lhs.name == rhs.name
    }
    
}



/* FIXME: https://github.com/Anviking/Decodable/issues/120
private struct AccessibilityInfo: Decodable {
    let data: [String: Any]
    
    static func decode(_ json: Any) throws -> AccessibilityInfo {
        return try AccessibilityInfo(
            data: [String: Any].decode(json)
        )
    }
}
*/
class DictionaryTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testNormal() {
        let json: NSDictionary = ["object": ["key1": 1, "key2": 2, "key3": 3]]
        let a: [String: Int] = try! json => "object"
        XCTAssertEqual(a, ["key1": 1, "key2": 2, "key3": 3])
    }
    
    func testDictionaryWithDecodableValues() {
        let json: NSDictionary = ["r": "red", "g": "green"]
        let result = try! [String: Color].decode(json)
        XCTAssertEqual(["r": Color(name: "red"), "g": Color(name: "green")], result)
    }
    
    func testOptionalReturn() {
        var json: NSDictionary = ["object": ["key1": 1, "key2": 2, "key3": 3]]
        var result: [String: Int]? = try! json => "object"
        XCTAssertEqual(result!, ["key1": 1, "key2": 2, "key3": 3])
        
        json = ["object": NSNull()]
        result = try! json => "object"
        XCTAssertNil(result)
    }
    
    /* FIXME: https://github.com/Anviking/Decodable/issues/120
    func testStringAny() {
        let dict: NSDictionary = ["a": 2]
        let info = try! AccessibilityInfo.decode(dict)
        XCTAssertEqual(info.data as NSDictionary, dict)
        
    }
     */

}
