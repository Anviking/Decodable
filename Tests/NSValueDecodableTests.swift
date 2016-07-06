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
        XCTAssertEqual(try! Int64.decode(number), number.int64Value)
        XCTAssertEqual(try! Int32.decode(number), number.int32Value)
        XCTAssertEqual(try! Int16.decode(number), number.int16Value)
        XCTAssertEqual(try! Int8.decode(number), number.int8Value)
        
        XCTAssertEqual(try! UInt64.decode(number), number.uint64Value)
        XCTAssertEqual(try! UInt32.decode(number), number.uint32Value)
        XCTAssertEqual(try! UInt16.decode(number), number.uint16Value)
        XCTAssertEqual(try! UInt8.decode(number), number.uint8Value)
    }
    
    func testIntegerDecodingFromInt32() {
        let number = NSNumber(value: 100)
        XCTAssertEqual(try! Int64.decode(number), number.int64Value)
        XCTAssertEqual(try! Int32.decode(number), number.int32Value)
        XCTAssertEqual(try! Int16.decode(number), number.int16Value)
        XCTAssertEqual(try! Int8.decode(number), number.int8Value)
        
        XCTAssertEqual(try! UInt64.decode(number), number.uint64Value)
        XCTAssertEqual(try! UInt32.decode(number), number.uint32Value)
        XCTAssertEqual(try! UInt16.decode(number), number.uint16Value)
        XCTAssertEqual(try! UInt8.decode(number), number.uint8Value)
    }
    
    func testIntegerDecodingFromInt8() {
        let number = NSNumber(value: 100)
        
        XCTAssertEqual(try! Int64.decode(number), number.int64Value)
        XCTAssertEqual(try! Int32.decode(number), number.int32Value)
        XCTAssertEqual(try! Int16.decode(number), number.int16Value)
        XCTAssertEqual(try! Int8.decode(number), number.int8Value)
        
        XCTAssertEqual(try! UInt64.decode(number), number.uint64Value)
        XCTAssertEqual(try! UInt32.decode(number), number.uint32Value)
        XCTAssertEqual(try! UInt16.decode(number), number.uint16Value)
        XCTAssertEqual(try! UInt8.decode(number), number.uint8Value)
    }
}
