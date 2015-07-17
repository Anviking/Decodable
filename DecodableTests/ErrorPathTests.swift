//
//  ErrorPathTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-16.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

class ErrorPathTests: XCTestCase {
    
    /*
    func testTypeMisMatch() {
        // given
        let dictionary: NSDictionary = ["key": ["test": 3]]
        // when
        do {
            try (dictionary => "key" => "test") as [String]
        } catch let DecodingError.TypeMismatch(path: path, type: type, object: object) {
            XCTAssertEqual(path, ["key"])
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
*/
    /*
    func testFoo() {
        let dictionary: NSDictionary = ["key": ["test": 3]]
        let a: Int = try uppercase(dictionary => "key") as AnyObject => "TEST"
    }
    
    func uppercase(json: [String: AnyObject]) -> [String: AnyObject] {
        var result = [String: AnyObject]()
        for (key, value) in json {
            result[key] = value.uppercaseString
        }
        return result
    }
*/
    
}
