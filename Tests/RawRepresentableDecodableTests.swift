//
//  RawRepresentableDecodableTests.swift
//  Decodable
//
//  Created by Daniel Garbień on 06/11/15.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
import protocol Decodable.Decodable
import enum Decodable.DecodingError
@testable import Decodable

enum CMYKColor: String, Decodable {
    case Cyan = "Cyan"
    case Magenta = "Magenta"
    case Yellow = "Yellow"
    case Black = "Black"
}

class RawRepresentableDecodableTests: XCTestCase {
    
    func testDecodingCorrectRawRepresentableValueSucceed() {
        // given
        let key = "color"
        let color = "Cyan"
        let json = JSON(object: [key: color] as NSDictionary)
        // when
        let cmykColor: CMYKColor = try! json => KeyPath(key)
        // then
        XCTAssertEqual(cmykColor, CMYKColor.Cyan)
    }
    
    func testDecodingIncorrectRawRepresentableValueFail() {
        // given
        let key = "color"
        let color = "Green"
        let json = JSON(object: [key: color] as NSDictionary)
        // when
        do {
            _ = try json => KeyPath(key) as CMYKColor
            XCTFail()
        } catch DecodingError.rawRepresentableInitializationError(_, let metadata) {
            // then
            XCTAssertNotNil(metadata.object)
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testDecodingIncorrectRawRepresentableTypeFail() {
        // given
        let key = "color"
        let color = 0
        let json = JSON(object: [key: color] as NSDictionary)
        // when
        do {
            _ = try json => KeyPath(key) as CMYKColor
            XCTFail()
        } catch let DecodingError.typeMismatch(expected, _, metadata) where expected == CMYKColor.RawValue.self {
            // then
            XCTAssertNotNil(metadata.object)
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
}
