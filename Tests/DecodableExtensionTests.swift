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
            _ = try String.decode(anyObject)
        } catch DecodingError.typeMismatch {
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
            _ = try Int.decode(anyObject)
        } catch DecodingError.typeMismatch {
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
            _ = try Double.decode(anyObject)
        } catch DecodingError.typeMismatch {
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
            _ = try Bool.decode(anyObject)
        } catch DecodingError.typeMismatch {
            //then
            XCTAssertTrue(true)
        } catch {
            XCTFail("should not throw this exception")
        }
    }
	
	// MARK: Date
	func testDateDecodable() {
		//given
		let anyObject = "1970-01-01T00:00:00Z"
		//when
		let date = try! Date.decode(anyObject)
		//then
		XCTAssertEqual(date, Date(timeIntervalSince1970: 0))
	}
	
	func testDateDecodableFail() {
		//given
		let anyObject = ""
		//when
		do {
			_ = try Date.decode(anyObject)
		} catch DecodingError.rawRepresentableInitializationError(let rawValue, let metaData) {
			//then
			XCTAssertEqual(rawValue as! String, "")
			XCTAssertEqual(metaData.object as! String, anyObject)
		} catch {
			XCTFail("should not throw this exception")
		}
	}
	
	// MARK: URL
	func testURLDecodable() {
		//given
		let anyObject = "http://www.google.com"
		//when
		let url = try! URL.decode(anyObject)
		//then
		XCTAssertEqual(url, URL(string: anyObject))
	}
	
	func testURLDecodableFail() {
		//given
		let anyObject = ""
		//when
		do {
			_ = try URL.decode(anyObject)
		} catch DecodingError.rawRepresentableInitializationError(let rawValue, let metaData) {
			//then
			XCTAssertEqual(rawValue as! String, "")
			XCTAssertEqual(metaData.object as! String, anyObject)
		} catch {
			XCTFail("should not throw this exception")
		}
	}
}
