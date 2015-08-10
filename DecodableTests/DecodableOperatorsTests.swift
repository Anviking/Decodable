//
//  DecodableOperatorsTests.swift
//  Decodable
//
//  Created by FJBelchi on 13/07/15.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

class DecodableOperatorsTests: XCTestCase {

    // MARK: =>
    
    func testDecodeAnyDecodableSuccess() {
        // given
        let key = "key"
        let value = "value"
        let dictionary: NSDictionary = [key: value]
        // when
        let string = try! dictionary => key as String
        // then
        XCTAssertEqual(string, value)
    }
    
    func testDecodeAnyDecodableDictionarySuccess() {
        // given
        let key = "key"
        let value: NSDictionary = [key : "value"]
        let dictionary: NSDictionary = [key: value]
        // when
        let result: NSDictionary = try! dictionary => key
        // then
        XCTAssertEqual(result, value)
    }
    
    func testDecodeNestedDictionarySuccess() {
        // given
        let key = "key"
        let value: NSDictionary = ["aKey" : "value"]
        let dictionary: NSDictionary = [key: [key: value]]
        // when
        let result = try! dictionary => key => key
        // then
        XCTAssertEqual(result, value)
    }

    func testDecodeNestedDictionaryOptionalSuccess() {
        // given
        let key = "key"
        let value: NSDictionary = ["aKey" : "value"]
        let dictionary: NSDictionary = [key: [key: value]]
        // when
        let result: [String: AnyObject]? = dictionary => key => key
        // then
        XCTAssertEqual(result, value)
    }

    
    func testDecodeNestedDictionaryCastingSuccess() {
        // given
        let key = "key"
        let value: NSDictionary = ["aKey" : "value"]
        let dictionary: NSDictionary = [key: [key: value]]
        // when
        let result = try! dictionary => key => key as! [String: String]
        // then
        XCTAssertEqual(result, value)
    }

    func testDecodeAnyDecodableOptionalSuccess() {
        // given
        let key = "key"
        let value = "value"
        let dictionary: NSDictionary = [key: value]
        // when
        let string = dictionary => key as String?
        // then
        XCTAssertEqual(string!, value)
    }
    
    func testDecodeAnyDecodableOptionalNilSuccess() {
        // given
        let key = "key"
        let dictionary: NSDictionary = [key: NSNull()]
        // when
        let string = dictionary => key as String?
        // then
        XCTAssertNil(string)
    }
    
    
    // MARK: => Errors
    
    func testDecodeNestedDictionaryCastingFailure() {
        // given
        let value: NSDictionary = ["apple" : 2]
        let dictionary: NSDictionary = ["firstKey": ["secondKey": value]]
        // when
        do {
            _ = try dictionary => "firstKey" => "secondKey" as [String: String]
            XCTFail()
        } catch DecodingError.TypeMismatch(let type, let info) {
            // then
            XCTAssertEqual(info.formattedPath, "firstKey.secondKey")
            XCTAssertEqual(info.object as? NSDictionary, value)
            XCTAssertTrue(type == Dictionary<Swift.String, Swift.String>.self)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
    
    func testDecodeAnyDecodableThrowMissingKeyException() {
        // given
        let key = "key"
        let value = "value"
        let dictionary: NSDictionary = [key: value]
        // when
        do {
            try dictionary => "nokey" as String
        } catch DecodingError.MissingKey(let key, let info) {
            // then
            XCTAssertEqual(key, "nokey")
            XCTAssertEqual(info.path, [])
            XCTAssertEqual(info.formattedPath, "")
            XCTAssertEqual(info.object as? NSDictionary, dictionary)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
    
    func testDecodeAnyDecodableThrowNoJsonObjectException() {
        // given
        let key = "key"
        let noDictionary: NSString = "hello"
        // when
        do {
            try noDictionary => key as String
        } catch DecodingError.TypeMismatch(let type, let info) {
            // then
            XCTAssertTrue(true)
            XCTAssertEqual(info.formattedPath, "")
            XCTAssert(type == NSDictionary.self)
            XCTAssertEqual(info.object as? NSString, noDictionary)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
    
    func testDecodeAnyDecodableDictionaryThrowMissingKeyException() {
        // given
        let key = "key"
        let value: NSDictionary = [key : "value"]
        let dictionary: NSDictionary = [key: value]
        // when
        do {
            try dictionary => "nokey"
        } catch DecodingError.MissingKey(let key, let info) {
            // then
            XCTAssertEqual(key, "nokey")
            XCTAssertEqual(info.formattedPath, "")
            XCTAssertEqual(info.path, [])
            XCTAssertEqual(info.object as? NSDictionary, dictionary)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
    
    func testDecodeAnyDecodableDictionaryThrowJSONNotObjectException() {
        // given
        let key = "key"
        let noDictionary: NSString = "noDictionary"
        // when
        do {
            try noDictionary => key
        } catch DecodingError.TypeMismatch(let type, let info) {
            // then
            XCTAssertTrue(true)
            XCTAssert(type == NSDictionary.self)
            XCTAssertEqual(info.formattedPath, "")
            XCTAssertEqual(info.object as? NSString, noDictionary)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
    
    func testDecodeAnyDecodableDictionaryThrowTypeMismatchException() {
        // given
        let key = "key"
        let dictionary: NSDictionary = [key: "value"]
        // when
        do {
            try dictionary => key
        } catch DecodingError.TypeMismatch {
            // then
            XCTAssertTrue(true)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
}
