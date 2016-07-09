//
//  KeyPathTests.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-09.
//  Copyright © 2016 anviking. All rights reserved.
//

import XCTest
@testable import Decodable
class KeyPathTests: XCTestCase {

    func testCreateFromStringLiteral() {
        let keyPath: KeyPath = "a"
        XCTAssertEqual(keyPath.keys, ["a"])
    }
    
    func testCreateFromArrayLiteral() {
        let keyPath: KeyPath = ["a", "b"]
        XCTAssertEqual(keyPath.keys, ["a", "b"])
    }
    
    func testCreateWithOperators() {
        let keyPath: KeyPath = "a" => "b"
        XCTAssertEqual(keyPath.keys, ["a", "b"])
    }
    
    func testJoiningKeyPaths() {
        let a: KeyPath = "a"
        let bAndC: KeyPath = ["b", "c"]
        let keyPath: KeyPath = a => bAndC
        XCTAssertEqual(keyPath.keys, ["a", "b", "c"])
    }
}

class OptionalKeyPathTests: XCTestCase {
    func testCreateFromStringLiteral() {
        let keyPath: OptionalKeyPath = "a"
        XCTAssertEqual(keyPath.keys, [OptionalKey(key: "a", isRequired: false)])
    }
    
    func testCreateFromArrayLiteral() {
        let keyPath: OptionalKeyPath = ["a", "b"]
        XCTAssertEqual(keyPath.keys, [
            OptionalKey(key: "a", isRequired: false),
            OptionalKey(key: "b", isRequired: false),
            ])
    }
    
    func testCreateWithOperators() {
        let keyPath: OptionalKeyPath = "a" =>? "b"
        XCTAssertEqual(keyPath.keys, [
            OptionalKey(key: "a", isRequired: false),
            OptionalKey(key: "b", isRequired: false),
            ])
    }
    
    func testJoiningKeyPaths() {
        let a: OptionalKeyPath = "a"
        let bAndC: OptionalKeyPath = ["b", "c"]
        let keyPath: OptionalKeyPath = a =>? bAndC
        XCTAssertEqual(keyPath.keys, [
            OptionalKey(key: "a", isRequired: false),
            OptionalKey(key: "b", isRequired: false),
            OptionalKey(key: "c", isRequired: false)
            ])
    }
}
