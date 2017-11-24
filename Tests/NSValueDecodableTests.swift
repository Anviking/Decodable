//
//  NSValueDecodableTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-01-06.
//  Copyright © 2016 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

class NSValueDecodableTests: XCTestCase {
    func testIntegerDecodingFromInt64() {
        let number = NSNumber(value: 100)
        let json = JSON(object: number)
        XCTAssertEqual(try! Int64.decode(json), number.int64Value)
        XCTAssertEqual(try! Int32.decode(json), number.int32Value)
        XCTAssertEqual(try! Int16.decode(json), number.int16Value)
        XCTAssertEqual(try! Int8.decode(json), number.int8Value)
        
        XCTAssertEqual(try! UInt64.decode(json), number.uint64Value)
        XCTAssertEqual(try! UInt32.decode(json), number.uint32Value)
        XCTAssertEqual(try! UInt16.decode(json), number.uint16Value)
        XCTAssertEqual(try! UInt8.decode(json), number.uint8Value)
    }
    
    func testIntegerDecodingFromInt32() {
        let number = NSNumber(value: 100)
        let json = JSON(object: number)
        XCTAssertEqual(try! Int64.decode(json), number.int64Value)
        XCTAssertEqual(try! Int32.decode(json), number.int32Value)
        XCTAssertEqual(try! Int16.decode(json), number.int16Value)
        XCTAssertEqual(try! Int8.decode(json), number.int8Value)
        
        XCTAssertEqual(try! UInt64.decode(json), number.uint64Value)
        XCTAssertEqual(try! UInt32.decode(json), number.uint32Value)
        XCTAssertEqual(try! UInt16.decode(json), number.uint16Value)
        XCTAssertEqual(try! UInt8.decode(json), number.uint8Value)
    }
    
    func testIntegerDecodingFromInt8() {
        let number = NSNumber(value: 100)
        let json = JSON(object: number)
        XCTAssertEqual(try! Int64.decode(json), number.int64Value)
        XCTAssertEqual(try! Int32.decode(json), number.int32Value)
        XCTAssertEqual(try! Int16.decode(json), number.int16Value)
        XCTAssertEqual(try! Int8.decode(json), number.int8Value)
        
        XCTAssertEqual(try! UInt64.decode(json), number.uint64Value)
        XCTAssertEqual(try! UInt32.decode(json), number.uint32Value)
        XCTAssertEqual(try! UInt16.decode(json), number.uint16Value)
        XCTAssertEqual(try! UInt8.decode(json), number.uint8Value)
    }
}
