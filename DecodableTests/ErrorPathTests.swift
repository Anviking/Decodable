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
    
    func testMissingKeyErrorPath() {
        
        let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": "anviking"]]]]
        
        do {
            try dict => "object" => "repo" => "owner" => "oops" as String
        } catch DecodingError.MissingKey(_, let info) {
            XCTAssertEqual(info.formattedPath, "object.repo.owner")
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    
    func testTypeMismatchErrorPath() {
        
        let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": 0]]]]
        
        do {
            try dict => "object" => "repo" => "owner" => "login" as String
        } catch DecodingError.TypeMismatch(_, let info) {
            XCTAssertEqual(info.formattedPath, "object.repo.owner.login")
            XCTAssertEqual(info.object as! Int, 0)
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    

    func testFoo() {
        let dictionary: NSDictionary = ["key": ["test": 3]]
        let a: Int = try! uppercase(dictionary => "key") as AnyObject => "TEST"
        XCTAssertEqual(a, 3)
    }
    
    private func uppercase(json: NSDictionary) -> NSDictionary {
        var result = [String: AnyObject]()
        for (key, value) in json {
            result[key.uppercaseString] = value
        }
        print(result)
        return result
    }

}
