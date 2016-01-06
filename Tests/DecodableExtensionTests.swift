//
//  DecodableExtensionTests.swift
//  Decodable
//
//  Created by FJBelchi on 13/07/15.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

class DecodableExtensionTests: XCTestCase {
    
    // MARK: String
    func testStringDecodableSuccess() {
        //given
        let anyObject = "hello"
        //when
        let string = try! String.decode(anyObject)
        //then
        XCTAssertEqual(string, anyObject)
    }
    
    func testStringDecodableFail() {
        //given
        let anyObject = 0
        //when
        do {
            try String.decode(anyObject)
        } catch DecodingError.TypeMismatch {
            //then
            XCTAssertTrue(true)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
    
    // MARK: Int
    func testIntDecodable() {
        //given
        let anyObject = 0
        //when
        let int = try! Int.decode(anyObject)
        //then
        XCTAssertEqual(int, anyObject)
    }
    
    func testIntDecodableFail() {
        //given
        let anyObject = ""
        //when
        do {
            try Int.decode(anyObject)
        } catch DecodingError.TypeMismatch {
            //then
            XCTAssertTrue(true)
        } catch {
            XCTFail("should not throw this exception")
        }
    }

    // MARK: Double
    func testDoubleDecodable() {
        //given
        let anyObject = 0.5
        //when
        let double = try! Double.decode(anyObject)
        //then
        XCTAssertEqual(double, anyObject)
    }
    
    func testDoubleDecodableFail() {
        //given
        let anyObject = ""
        //when
        do {
            try Double.decode(anyObject)
        } catch DecodingError.TypeMismatch {
            //then
            XCTAssertTrue(true)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
    
    // MARK: Bool
    func testBoolDecodable() {
        //given
        let anyObject = true
        //when
        let bool = try! Bool.decode(anyObject)
        //then
        XCTAssertEqual(bool, anyObject)
    }
    
    func testBoolDecodableFail() {
        //given
        let anyObject = ""
        //when
        do {
            try Bool.decode(anyObject)
        } catch DecodingError.TypeMismatch {
            //then
            XCTAssertTrue(true)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
}