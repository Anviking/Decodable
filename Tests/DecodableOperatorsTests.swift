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
        let string = try! dictionary => KeyPath(key) as String
        // then
        XCTAssertEqual(string, value)
    }
    
    func testDecodeAnyDecodableDictionarySuccess() {
        // given
        let key = "key"
        let value: NSDictionary = [key : "value"]
        let dictionary: NSDictionary = [key: value]
        // when
        let result: NSDictionary = try! dictionary => KeyPath(key) as! NSDictionary
        // then
        XCTAssertEqual(result, value)
    }
    
    func testDecodeDictOfArraysSucess() {
        // given
        let key = "key"
        let value: NSDictionary = ["list": [1, 2, 3]]
        let dictionary: NSDictionary = [key: value]
        // when
        let result: [String: [Int]] = try! dictionary => KeyPath(key)
        // then
        XCTAssertEqual(result as NSDictionary, value)
    }
    
    // MARK: - Nested keys
    
    func testDecodeNestedDictionarySuccess() {
        // given
        let value: NSDictionary = ["aKey" : "value"]
        let dictionary: NSDictionary = ["key": ["key": value]]
        // when
        let result = try! dictionary => "key" => "key"
        // then
        XCTAssertEqual(result as? NSDictionary, value)
    }

    func testDecodeNestedDictionaryOptionalSuccess() {
        // given
        let value: NSDictionary = ["aKey" : "value"]
        let dictionary: NSDictionary = ["key": ["key": value]]
        // when
        let result = try! dictionary => "key" => "key" as! [String : Any]
        // then
        XCTAssertEqual(result as NSDictionary, value)
    }

	// TODO: this does not compile with Swift 3
//    func testDecodeNestedIntSuccess() {
//        // given
//        let value = 4
//        let dictionary: NSDictionary = ["key1": ["key2": ["key3": value]]]
//        // when
//		let result: Int = try! dictionary => "key1" => "key2" => "key3"
//        // then
//        XCTAssertEqual(result, value)
//    }

    func testDecodeNestedDictionaryCastingSuccess() {
        // given

        let value: NSDictionary = ["aKey" : "value"]
        let dictionary: NSDictionary = ["key": ["key": value]]
        // when
        let result = try! dictionary => "key" => "key" as! [String: String]
        // then
        XCTAssertEqual(result, value as! [String : String])
    }

    func testDecodeAnyDecodableOptionalSuccess() {
        // given
        let key = "key"
        let value = "value"
        let dictionary: NSDictionary = [key: value]
        // when
        let string = try! dictionary => KeyPath(key) as String?
        // then
        XCTAssertEqual(string!, value)
    }
    
    func testDecodeAnyDecodableOptionalNilSuccess() {
        // given
        let key = "key"
        let dictionary: NSDictionary = [key: NSNull()]
        // when
        let string = try! dictionary => KeyPath(key) as String?
        // then
        XCTAssertNil(string)
    }
    
    func testDecodeAnyDecodableOptionalTypeMismatchFailure() {
        // given
        let key = "key"
        let dictionary: NSDictionary = [key: 2]
        // when
        do {
            let a = try dictionary => KeyPath(key) as String?
            print(a as Any)
            XCTFail()
        } catch let DecodingError.typeMismatch(_, actual, _) {
            XCTAssertEqual(String(describing: actual), "_SwiftTypePreservingNSNumber")
        } catch let error {
            XCTFail("should not throw \(error)")
        }
    }
    
    // MARK: - Nested =>? operators
    
    // Should throw on typemismatch with correct metadata
    func testDecodeNestedTypeMismatchFailure() {
        let json: NSDictionary = ["user": ["followers": "not_an_integer"]]
        do {
            let _ : Int? = try json =>? "user" => "followers"
            XCTFail("should throw")
        } catch let DecodingError.typeMismatch(_, _, metadata) {
            XCTAssertEqual(metadata.formattedPath, "user.followers")
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
    
    // Should currently (though really it shoult not) treat all keys as either optional or non-optional
    func testDecodeNestedTypeReturnNilForSubobjectMissingKey() {
        let json: NSDictionary = ["user": ["something_else": "test"]]
        try! XCTAssertEqual(json =>? "user" =>? "followers", Optional<Int>.none)
    }
    
    // Sanity check
    func testDecodeNestedTypeSuccess() {
        let json: NSDictionary = ["user": ["followers": 3]]
        try! XCTAssertEqual(json =>? "user" => "followers", 3)
    }
    
    
    // MARK: => Errors
    
    /* // 
    func testDecodeNestedDictionaryCastingFailure() {
        // given
        let value: NSDictionary = ["apple" : 2]
        let dictionary: NSDictionary = ["firstKey": ["secondKey": value]]
        // when
        do {
            _ = try dictionary => "firstKey" => "secondKey" as [String: String]
            XCTFail()
        } catch DecodingError.typeMismatchError(_, Dictionary<String, String>.self, let info) {
            // then
            XCTAssertEqual(info.formattedPath, "firstKey.secondKey")
            XCTAssertEqual(info.object as? NSDictionary, value)
        } catch let error {
            XCTFail("should not throw \(error)")
        }
    }
    */
    
    func testDecodeAnyDecodableThrowMissingKeyException() {
        // given
        let key = "key"
        let value = "value"
        let dictionary: NSDictionary = [key: value]
        // when
        do {
            _ = try dictionary => "nokey" as String
        } catch let DecodingError.missingKey(key, metadata) {
            // then
            XCTAssertEqual(key, "nokey")
            XCTAssertEqual(metadata.path, [])
            XCTAssertEqual(metadata.formattedPath, "")
            XCTAssertEqual(metadata.object as? NSDictionary, dictionary)
        } catch let error {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testDecodeAnyDecodableThrowNoJsonObjectException() {
        // given
        let key = "key"
        let noDictionary: NSString = "hello"
        // when
        do {
            _ = try noDictionary => KeyPath(key) as String
        } catch let DecodingError.typeMismatch(expected, actual, metadata) where expected == NSDictionary.self {
            // then
            XCTAssertTrue(true)
            XCTAssertEqual(String(describing: actual), "__NSCFString")
            XCTAssertEqual(metadata.formattedPath, "")
            XCTAssertEqual(metadata.object as? NSString, (noDictionary))
        } catch let error {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testDecodeAnyDecodableDictionaryThrowMissingKeyException() {
        // given
        let key = "key"
        let value: NSDictionary = [key : "value"]
        let dictionary: NSDictionary = [key: value]
        // when
        do {
            _ = try dictionary => "nokey"
        } catch let DecodingError.missingKey(key, metadata) {
            // then
            XCTAssertEqual(key, "nokey")
            XCTAssertEqual(metadata.formattedPath, "")
            XCTAssertEqual(metadata.path, [])
            XCTAssertEqual(metadata.object as? NSDictionary, dictionary)
        } catch let error {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testDecodeAnyDecodableDictionaryThrowJSONNotObjectException() {
        // given
        let key = "key"
        let noDictionary: NSString = "noDictionary"
        // when
        do {
            _ = try noDictionary => KeyPath(key)
        } catch let DecodingError.typeMismatch(expected, actual, metadata) where expected == NSDictionary.self {
            // then
            XCTAssertTrue(true)
            XCTAssertEqual(String(describing: actual), "__NSCFString")
            XCTAssertEqual(metadata.formattedPath, "")
            XCTAssertEqual(metadata.object as? NSString, noDictionary)
        } catch let error {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testDecodeAnyDecodableDictionaryThrowTypeMismatchException() {
        // given
        let key = "key"
        let dictionary: NSDictionary = [key: "value"]
        // when
        do {
            _ = try dictionary => KeyPath(key)
        } catch DecodingError.typeMismatch {
            // then
            XCTAssertTrue(true)
        } catch let error {
            XCTFail("should not throw \(error)")
        }
    }
}
