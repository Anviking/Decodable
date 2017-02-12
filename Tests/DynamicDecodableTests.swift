//
//  DynamicDecodableTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-29.
//  Copyright © 2016 anviking. All rights reserved.
//

import XCTest
import Foundation
@testable import Decodable

class DynamicDecodableTests: XCTestCase {
    
    private var originalNSArrayDecoder = NSArray.decoder
    func testCustomArrayDecoding() {
        NSArray.decoder = { json in
            switch json {
            case let array as NSArray:
                return array
            default:
                return [json]
            }
        }
        
        let arrayJSON: NSArray = ["a", "b", "c"]
        let objectJSON: NSString = "d"
        
        XCTAssertEqual(try! [String].decode(arrayJSON), ["a", "b", "c"])
        XCTAssertEqual(try! [String].decode(objectJSON), ["d"])
        
        NSArray.decoder = originalNSArrayDecoder
        
    }
}
