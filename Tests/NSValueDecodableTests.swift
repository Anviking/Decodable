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
        let number = NSNumber(longLong: 100)
        XCTAssertEqual(try! Int64.decode(number), number.longLongValue)
        XCTAssertEqual(try! Int32.decode(number), number.intValue)
        XCTAssertEqual(try! Int16.decode(number), number.shortValue)
        XCTAssertEqual(try! Int8.decode(number), number.charValue)
        
        XCTAssertEqual(try! UInt64.decode(number), number.unsignedLongLongValue)
        XCTAssertEqual(try! UInt32.decode(number), number.unsignedIntValue)
        XCTAssertEqual(try! UInt16.decode(number), number.unsignedShortValue)
        XCTAssertEqual(try! UInt8.decode(number), number.unsignedCharValue)
    }
    
    func testIntegerDecodingFromInt32() {
        let number = NSNumber(int: 100)
        // XCTAssertEqual(try! Int64.decode(number), number.longLongValue)
        XCTAssertEqual(try! Int32.decode(number), number.intValue)
        XCTAssertEqual(try! Int16.decode(number), number.shortValue)
        XCTAssertEqual(try! Int8.decode(number), number.charValue)
        
        // XCTAssertEqual(try! UInt64.decode(number), number.unsignedLongLongValue)
        XCTAssertEqual(try! UInt32.decode(number), number.unsignedIntValue)
        XCTAssertEqual(try! UInt16.decode(number), number.unsignedShortValue)
        XCTAssertEqual(try! UInt8.decode(number), number.unsignedCharValue)
    }
    
    func testIntegerDecodingFromInt8() {
        let number = NSNumber(char: 100)
        
        // It's ok
        // XCTAssertEqual(try! Int64.decode(number), number.longLongValue)
        XCTAssertEqual(try! Int32.decode(number), number.intValue)
        XCTAssertEqual(try! Int16.decode(number), number.shortValue)
        XCTAssertEqual(try! Int8.decode(number), number.charValue)
        
        // XCTAssertEqual(try! UInt64.decode(number), number.unsignedLongLongValue)
        XCTAssertEqual(try! UInt32.decode(number), number.unsignedIntValue)
        XCTAssertEqual(try! UInt16.decode(number), number.unsignedShortValue)
        XCTAssertEqual(try! UInt8.decode(number), number.unsignedCharValue)
    }
}