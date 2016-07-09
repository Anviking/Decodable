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
        let result = try! dictionary => KeyPath(key) as Array<String>
        // then
        XCTAssertEqual(result, value)
    }
    
    func testDecodeOptionalDecodableArraySuccess() {
        // given
        let key = "key"
        let value: NSArray = ["value1", "value2", NSNull(), "value3"]
        let dictionary: NSDictionary = [key: value]
        // when
        let result = try! dictionary => KeyPath(key) as [String?]
        // then
        XCTAssertEqual(result.count, 4)
        XCTAssertEqual(result[0], "value1")
        XCTAssertEqual(result[1], "value2")
        XCTAssertEqual(result[2], nil)
        XCTAssertEqual(result[3], "value3")
    }
    
    func testDecodeOptionalDecodableArrayFailure() {
        // given
        let key = "key"
        let value: NSArray = ["value1", "value2", 0x8BAD, "value3"]
        let dictionary: NSDictionary = [key: value]
        // when
        do {
            _ = try dictionary => KeyPath(key) as [String?]
            XCTFail("should throw")
        } catch DecodingError.TypeMismatch {
            // Yay
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testDecodeNestedDecodableArraySuccess() {
        // given
        let value: NSArray = ["value1", "value2", "value3"]
        let dictionary: NSDictionary = ["key": ["key": value]]
        // when
        let result = try! dictionary => "key" => "key" as Array<String>
        // then
        XCTAssertEqual(result, value)
    }
    
    func testDecodeAnyDecodableOptionalArraySuccess() {
        // given
        let key = "key"
        let value = ["value"]
        let dictionary: NSDictionary = [key: value]
        // when
        let string = try! dictionary => KeyPath(key) as [String]?
        // then
        XCTAssertEqual(string!, value)
    }
    
    func testDecodeAnyDecodableNestedOptionalArraySuccess() {
        // given
        let value = ["value"]
        let dictionary: NSDictionary = ["key": ["key": value]]
        // when
        let string = try! dictionary => "key" => "key" as [String]?
        // then
        XCTAssertEqual(string!, value)
    }
    
    func testDecodeAnyDecodableOptionalArrayNilSuccess() {
        // given
        let key = "key"
        let dictionary: NSDictionary = [key: NSNull()]
        // when
        let string = try! dictionary => KeyPath(key) as [String]?
        // then
        XCTAssertNil(string)
    }
    
    func testDecodeAnyDecodableOptionalArrayMissingKeyFailure() {
        // given
        let key = "key"
        let dictionary = NSDictionary()
        // when
        do {
            _ = try dictionary => KeyPath(key) as [String]?
            XCTFail()
        } catch DecodingError.MissingKey {
            
        } catch {
            XCTFail()
        }
    }
    
    
    // MARK: =>?
    
    func testDecodeSafeArraySuccess() {
        // given
        let key = "key"
        let value = ["A", "B", "C"]
        let dictionary: NSDictionary = [key: value]
        // when
        let array = try? [String].decode(dictionary => "key")
        // then
        XCTAssertEqual(array!, value)
    }
    
    func testDecodeSafeArrayCatchTypeExceptionMismatch() {
        // given
        let key = "key"
        let value = ["A", 2, "B"]
        let dictionary: NSDictionary = [key: value]
        // when
        let array = try! [String].decode(dictionary => "key", ignoreInvalidObjects: true)
        // then
        XCTAssertEqual(array, ["A", "B"])
    }
    
    func testDecodeSafeArrayCatchTypeMismatchExceptionInObjects() {
        // given
        let key = "key"
        let value = [["id": "007", "login": "mradams"], ["id": 1, "login": "jenglish"]]
        let dictionary: NSDictionary = [key: value]
        // when
        let array = try! [Owner].decode(dictionary => "key", ignoreInvalidObjects: true)
        // then
        XCTAssertEqual(array, [Owner(id: 1, login: "jenglish")])
    }
    
    func testDecodeSafeArrayCatchJSONNotObjectException() {
        // given
        let key = "key"
        let value = [["id": 7, "login": "mradams"], 2]
        let dictionary: NSDictionary = [key: value]
        // when
        let array = try! [Owner].decode(dictionary => "key", ignoreInvalidObjects: true)
        // then
        XCTAssertEqual(array, [Owner(id: 7, login: "mradams")])
    }
    
    func testDecodeSafeArrayCatchMissingKeyException() {
        // given
        let key = "key"
        let value = [["login": "mradams"], ["id": 1, "login": "jenglish"]]
        let dictionary: NSDictionary = [key: value]
        // when
        let array = try! [Owner].decode(dictionary => KeyPath(key), ignoreInvalidObjects: true)
        // then
        XCTAssertEqual(array, [Owner(id: 1, login: "jenglish")])
    }
}
