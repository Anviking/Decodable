//
//  DecodableTests.swift
//  DecodableTests
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

class DecodableTests: XCTestCase {
    
    private func readJsonFile(file: String) -> NSDictionary {
        let filePath = NSBundle(forClass: object_getClass(self)).resourcePath!.stringByAppendingPathComponent(file)
        let jsonString = try! String(contentsOfFile: filePath)
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)!
        return try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
    }
    
    func testDecodeRepositoryExampleShouldSuccess() {
        // given
        let json = readJsonFile("Repository.json")
    
        // when
        do {
            let repository = try Repository.decode(json)
            // then
            XCTAssertEqual(repository.id, json["id"] as! Int)
            XCTAssertEqual(repository.name, json["name"] as! String)
            XCTAssertEqual(repository.description, json["description"] as! String)
            XCTAssertEqual(repository.htmlUrlString, json["html_url"] as! String)
            
            let owner = repository.owner
            let ownerDictionary = json["owner"] as! NSDictionary
            XCTAssertEqual(owner.id, ownerDictionary["id"] as! Int)
            XCTAssertEqual(owner.login, ownerDictionary["login"] as! String)
            
            XCTAssertEqual(repository.coverage, json["coverage"] as! Double)
            let files = repository.files
            XCTAssertEqual(files.count, 3)
            let array = json["files"] as! Array<String>
            XCTAssertEqual(files[0], array[0])
            XCTAssertEqual(files[1], array[1])
            XCTAssertEqual(files[2], array[2])
            XCTAssertNil(repository.optional)
        } catch {
            XCTFail("it should not throw an exception")
        }
    }
    
    func testDecodeRepositoryExampleShouldThrowMissingKeyException() {
        // given
        let json = readJsonFile("MissingKey.json")
        
        // when
        do {
            try Repository.decode(json)
        } catch DecodingError.MissingKey(_, let string, _) {
            // then
            XCTAssertEqual(string, "id")
        } catch DecodingError.TypeMismatch {
            XCTFail("it should not throw this exception")
        } catch DecodingError.JSONNotObject {
            XCTFail("it should not throw this exception")
        } catch {
            XCTFail("it should not throw this exception")
        }
    }
    
    func testDecodeRepositoryExampleShouldThrowTypeMismatchException() {
        // given
        let json = readJsonFile("TypeMismatch.json")
        
        // when
        do {
            try Repository.decode(json)
        } catch DecodingError.MissingKey {
            XCTFail("it should not throw this exception")
        } catch DecodingError.TypeMismatch(let path, let type, _) {
            // then
            XCTAssert(type == Int.self)
        } catch DecodingError.JSONNotObject {
            XCTFail("it should not throw this exception")
        } catch {
            XCTFail("it should not throw this exception")
        }
    }
    
    func testDecodeRepositoryExampleShouldThrowNoJsonObjectException() {
        // given
        let filePath = NSBundle(forClass: object_getClass(self)).resourcePath!.stringByAppendingPathComponent("NoJsonObject.json")
        let jsonString = try! String(contentsOfFile: filePath)
        
        // when
        do {
            try Repository.decode(jsonString)
        } catch DecodingError.MissingKey {
            XCTFail("it should not throw this exception")
        } catch DecodingError.TypeMismatch {
            XCTFail("it should not throw this exception")
        } catch DecodingError.JSONNotObject {
            // then
            XCTAssertTrue(true)
        } catch {
            XCTFail("it should not throw this exception")
        }
    }
    
}
