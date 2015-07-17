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
        let result = try! dictionary => key
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

    /* Does not work
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
    */
    
    func testDecodeNestedDictionaryCastingSuccess() {
        // given
        let key = "key"
        let value: NSDictionary = ["aKey" : "value"]
        let dictionary: NSDictionary = [key: [key: value]]
        // when
        let result: [String: String] = try! dictionary => key => key
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

    
    // MARK: => Errors
    
    func testDecodeNestedDictionaryCastingFailure() {
        // given
        let key = "key"
        let value: NSDictionary = ["aKey" : 2]
        let dictionary: NSDictionary = [key: [key: value]]
        // when
        do {
            let _: [String: String] = try dictionary => key => key
            XCTFail()
        } catch DecodingError.TypeMismatch(let type, let object, _) {
            // then
            XCTAssertEqual(object as! NSDictionary, value)
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
        } catch DecodingError.MissingKey(let key, _, _) {
            // then
            XCTAssertEqual(key, "nokey")
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
        } catch DecodingError.TypeMismatch {
            // then
            XCTAssertTrue(true)
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
        } catch DecodingError.MissingKey(let key, _, _) {
            // then
            XCTAssertEqual(key, "nokey")
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
        } catch DecodingError.TypeMismatch {
            // then
            XCTAssertTrue(true)
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