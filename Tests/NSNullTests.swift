//
//  NSNullTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-12-28.
//  Copyright © 2016 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

class NSNullTests: XCTestCase {
    
    // https://github.com/Anviking/Decodable/issues/135
    func testNullToAny() {
        let json = NSDictionary(dictionary: ["tone": NSNull()])
        let maybeTone: JSON? = try! json =>? "tone"
        XCTAssertNil(maybeTone)
    }
    
}
