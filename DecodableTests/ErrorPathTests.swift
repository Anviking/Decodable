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
    
    func testPath() {
        
        let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": "anviking"]]]]
        
        do {
            try dict => "object" => "repo" => "owner" => "oops" as String
        } catch DecodingError.MissingKey( _, _, let path) {
            XCTAssertEqual(".".join(path), "object.repo.owner")
        } catch let error {
            XCTFail("should not throw this exception: \(error)")
        }
    }
    

    func testFoo() {
        let dictionary: NSDictionary = ["key": ["test": 3]]
        let a: Int = try! uppercase(dictionary => "key") as AnyObject => "TEST"
        XCTAssertEqual(a, 3)
    }
    
    private func uppercase(json: [String: AnyObject]) -> [String: AnyObject] {
        var result = [String: AnyObject]()
        for (key, value) in json {
            result[key.uppercaseString] = value
        }
        print(result)
        return result
    }

}
