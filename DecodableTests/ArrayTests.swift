//
//  ArrayTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-19.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

class DecodableArrayTests: XCTestCase {
    
    func testDecodeAnyDecodableArraySuccess() {
        // given
        let key = "key"
        let value: NSArray = ["value1", "value2", "value3"]
        let dictionary: NSDictionary = [key: value]
        // when
        let result = try! dictionary => key as Array<String>
        // then
        XCTAssertEqual(result, value)
    }
    
    func testDecodeNestedDecodableArraySuccess() {
        // given
        let key = "key"
        let value: NSArray = ["value1", "value2", "value3"]
        let dictionary: NSDictionary = [key: [key: value]]
        // when
        let result = try! dictionary => key => key as Array<String>
        // then
        XCTAssertEqual(result, value)
    }
    
    func testDecodeAnyDecodableOptionalArraySuccess() {
        // given
        let key = "key"
        let value = ["value"]
        let dictionary: NSDictionary = [key: value]
        // when
        let string = dictionary => key as [String]?
        // then
        XCTAssertEqual(string!, value)
    }
    
    func testDecodeAnyDecodableNestedOptionalArraySuccess() {
        // given
        let key = "key"
        let value = ["value"]
        let dictionary: NSDictionary = [key: [key: value]]
        // when
        let string = try! dictionary => key => key as [String]?
        // then
        XCTAssertEqual(string!, value)
    }
    
    func testDecodeAnyDecodableOptionalArrayWithNilSuccess() {
        // given
        let key = "key"
        let value = ["value1", NSNull(), "value2"]
        let dictionary: NSDictionary = [key: value]
        // when
        let string = try! dictionary =>? key as [String]?
        // then
        XCTAssertEqual(string!, ["value1", "value2"])
    }
    
    func testDecodeAnyDecodableOptionalArrayNilSuccess() {
        // given
        let key = "key"
        let dictionary: NSDictionary = [key: NSNull()]
        // when
        let string = dictionary => key as [String]?
        // then
        XCTAssertNil(string)
    }
    
    func testDecodeAnyDecodableOptionalArrayMissingKeySuccess() {
        // given
        let key = "key"
        let dictionary = NSDictionary()
        // when
        let string = dictionary => key as [String]?
        // then
        XCTAssertNil(string)
    }
    
    // MARK: =>?
    
    func testDecodeSafeArraySuccess() {
        // given
        let key = "key"
        let value = ["A", "B", "C"]
        let dictionary: NSDictionary = [key: value]
        // when
        let string = try! dictionary =>? key as [String]
        // then
        XCTAssertEqual(string, value)
    }
    
    func testDecodeSafeArrayCatchTypeExceptionMismatch() {
        // given
        let key = "key"
        let value = ["A", 2, "B"]
        let dictionary: NSDictionary = [key: value]
        // when
        let string = try! dictionary =>? key as [String]
        // then
        XCTAssertEqual(string, ["A", "B"])
    }
    
    func testDecodeSafeArrayCatchTypeMismatchExceptionInObjects() {
        // given
        let key = "key"
        let value = [["id": "007", "login": "mradams"], ["id": 1, "login": "jenglish"]]
        let dictionary: NSDictionary = [key: value]
        // when
        let array = try! dictionary =>? key as [Owner]
        // then
        XCTAssertEqual(array, [Owner(id: 1, login: "jenglish")])
    }
    
    func testDecodeSafeArrayCatchJSONNotObjectException() {
        // given
        let key = "key"
        let value = [["id": 7, "login": "mradams"], 2]
        let dictionary: NSDictionary = [key: value]
        // when
        let array = try! dictionary =>? key as [Owner]
        // then
        XCTAssertEqual(array, [Owner(id: 7, login: "mradams")])
    }
    
    func testDecodeSafeArrayCatchMissingKeyException() {
        // given
        let key = "key"
        let value = [["login": "mradams"], ["id": 1, "login": "jenglish"]]
        let dictionary: NSDictionary = [key: value]
        // when
        let array = try! dictionary =>? key as [Owner]
        // then
        XCTAssertEqual(array, [Owner(id: 1, login: "jenglish")])
    }
}