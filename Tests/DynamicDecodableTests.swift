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
    
    private var originalBoolDecoder = Bool.decoder
    private var originalNSArrayDecoder = NSArray.decoder
    
    func testCustomBooleanDecoding() {
        Bool.decoder = { json in
            switch json.json {
            case let str as String where str == "true":
                return true
            case let str as String where str == "false":
                return false
            default:
                return try cast(json)
            }
        }
        let json: NSString = "true"
        let result = try! Bool.decode(json)
        XCTAssertEqual(result, true)
        
        Bool.decoder = originalBoolDecoder
        
        XCTAssertNil(try? Bool.decode(json))
    }
    
    func testCustomArrayDecoding() {
        NSArray.decoder = { json in
            switch json.json {
            case let array as NSArray:
                return array
            default:
                return [json]
            }
        }
        
        let arrayJSON: NSArray = ["a", "b", "c"]
        let objectJSON: NSString = "d"
        
        XCTAssertEqual(try! [String].decode(JSON(value: arrayJSON)), ["a", "b", "c"])
        XCTAssertEqual(try! [String].decode(JSON(value: objectJSON)), ["d"])
        
        NSArray.decoder = originalNSArrayDecoder
        
    }
}
