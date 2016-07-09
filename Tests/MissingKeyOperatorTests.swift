//
//  missingKeyOperatorTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-12-20.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
import Decodable

class missingKeyOperatorTests: XCTestCase {
    
    func testMissingKey() {
        // Should return nil
        let dictionary: NSDictionary = ["key": 3]
        let result: Int? = try! dictionary =>? "missingKeyError"
        XCTAssertEqual(result, nil)
    }
    
    func testNSNull() {
        // Should return nil
        let dictionary: NSDictionary = ["key": NSNull()]
        let result: Int? = try! dictionary =>? "key"
        XCTAssertEqual(result, nil)
    }
    
    func testSuccess() {
        let dictionary: NSDictionary = ["key": 3]
        let result: Int? = try! dictionary =>? "key"
        XCTAssertEqual(result, 3)
    }
    
    func testTypeMismatch() {
        // Should throw
        let dictionary: NSDictionary = ["key": "3"]
        do {
            let _: Int? = try dictionary =>? "key"
            XCTFail("should throw")
        } catch let DecodingError.typeMismatch(expected, _, _) {
            XCTAssert(expected == Int.self, "\(expected) != Int.self")
        } catch {
            XCTFail("Should not throw \(error)")
        }
    }
    
}
