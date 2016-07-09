//
//  RawRepresentableDecodableTests.swift
//  Decodable
//
//  Created by Daniel Garbień on 06/11/15.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
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
        let json: NSDictionary = [key: color]
        // when
        let cmykColor: CMYKColor = try! json => KeyPath(key)
        // then
        XCTAssertEqual(cmykColor, CMYKColor.Cyan)
    }
    
    func testDecodingIncorrectRawRepresentableValueFail() {
        // given
        let key = "color"
        let color = "Green"
        let json: NSDictionary = [key: color]
        // when
        do {
            _ = try json => KeyPath(key) as CMYKColor
            XCTFail()
        } catch let error as RawRepresentableInitializationError {
            // then
            XCTAssertNotNil(error.object)
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
    
    func testDecodingIncorrectRawRepresentableTypeFail() {
        // given
        let key = "color"
        let color = 0
        let json: NSDictionary = [key: color]
        // when
        do {
            _ = try json => KeyPath(key) as CMYKColor
            XCTFail()
        } catch let error as TypeMismatchError where error.expectedType == CMYKColor.RawValue.self {
            // then
            XCTAssertNotNil(error.object)
        } catch {
            XCTFail("should not throw \(error)")
        }
    }
}
