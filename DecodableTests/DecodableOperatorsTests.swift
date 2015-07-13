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
    
    // MARK: => Errors
    
    func testDecodeAnyDecodableThrowMissingKeyException() {
        // given
        let key = "key"
        let value = "value"
        let dictionary: NSDictionary = [key: value]
        // when
        do {
            try dictionary => "nokey" as String
        } catch DecodingError.MissingKey(let key, _) {
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
        } catch DecodingError.JSONNotObject {
            // then
            XCTAssertTrue(true)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
}