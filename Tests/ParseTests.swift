//
//  ParseTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-13.
//  Copyright © 2016 anviking. All rights reserved.
//

import XCTest
import Foundation
@testable import Decodable

class ParseTests: XCTestCase {
    
    func testParseKeyPathSuccess() {
        let dict: NSDictionary = ["a": ["b": 3]]
        let a = try! parse(dict, ["a", "b"] as KeyPath)
        XCTAssertEqual(a as? Int, 3)
    }
    
    func testParseAndDecodeKeyPathSuccess() {
        let dict: NSDictionary = ["a": ["b": 3]]
        let a = try! parse(dict, keyPath: ["a", "b"], decoder: Int.decode)
        XCTAssertEqual(a, 3)
    }
    
    func testParseKeyPathMissingKey() {
        let dict: NSDictionary = ["a": ["b": 3]]
        do { _ = try parse(dict, KeyPath(["a", "c"])) }
        catch DecodingError.missingKey(let key, let metadata) {
            XCTAssertEqual(metadata.formattedPath, "a")
            XCTAssertEqual(key, "c")
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testParseAndDecodeKeyPathMissingKey() {
        let dict: NSDictionary = ["a": ["b": 3]]
        do { _ = try parse(dict, keyPath: ["a", "c"], decoder: Int.decode) }
        catch DecodingError.missingKey(let key, let metadata) {
            XCTAssertEqual(metadata.formattedPath, "a")
            XCTAssertEqual(key, "c")
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testParseAndDecodeKeyPathTypeMismatch() {
        let dict: NSDictionary = ["a": ["b": "3"]]
        do { _ = try parse(dict, keyPath: ["a", "b"], decoder: Int.decode) }
        catch DecodingError.typeMismatch(let expected, _, let metadata) {
            XCTAssertEqual("\(expected)", "Int")
            XCTAssertEqual(metadata.formattedPath, "a.b")
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
    
}
