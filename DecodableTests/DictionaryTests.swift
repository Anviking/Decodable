//
//  DictionaryTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-10-30.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
import Decodable

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
    
    func testOptionalReturn() {
        var json: NSDictionary = ["object": ["key1": 1, "key2": 2, "key3": 3]]
        var result: [String: Int]? = try! json => "object"
        XCTAssertEqual(result!, ["key1": 1, "key2": 2, "key3": 3])
        
        json = ["object": NSNull()]
        result = try! json => "object"
        XCTAssertNil(result)
    }

}
