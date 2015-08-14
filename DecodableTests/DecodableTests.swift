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
        let filePath = (NSBundle(forClass: object_getClass(self)).resourcePath! as NSString).stringByAppendingPathComponent(file)
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
            XCTAssertEqual(repository.id, json["id"] as? Int)
            XCTAssertEqual(repository.name, json["name"] as? String)
            XCTAssertEqual(repository.description, json["description"] as? String)
            XCTAssertEqual(repository.htmlUrlString, json["html_url"] as? String)
            
            let owner = repository.owner
            let ownerDictionary = json["owner"] as! NSDictionary
            XCTAssertEqual(owner.id, ownerDictionary["id"] as? Int)
            XCTAssertEqual(owner.login, ownerDictionary["login"] as? String)
            
            XCTAssertEqual(repository.coverage, json["coverage"] as? Double)
            let files = repository.files
            XCTAssertEqual(files.count, 3)
            let array = json["files"] as! Array<String>
            XCTAssertEqual(files[0], array[0])
            XCTAssertEqual(files[1], array[1])
            XCTAssertEqual(files[2], array[2])
            XCTAssertNil(repository.optional)
            XCTAssertTrue(repository.active)
            XCTAssertNil(repository.optionalActive)
        } catch {
            XCTFail("it should not throw an exception")
        }
    }
    
    func testDecodeArrayOfRepositoriesAndMeasureTime() {
        let json = readJsonFile("Repository.json")
        let array = NSArray(array: Array(count: 1000, repeatedValue: json))
        
        measureBlock {
            do {
                try [Repository].decode(array)
            } catch let error {
                XCTFail("\(error)")
            }
        }
    }
    
    func testCustomParseAndMeasureTime() {
        let json = readJsonFile("Repository.json")
        let array = NSArray(array: Array(count: 1000, repeatedValue: json))
        
        measureBlock {
            do {
                try self.customParseRepository(array)
            } catch let error {
                XCTFail("\(error)")
            }
        }
        
    }
    
    func customParseRepository(json: AnyObject) throws -> [Repository] {
        let error = NSError(domain: "test", code: 0, userInfo: nil)
        guard let array = json as? [NSDictionary] else {
            throw error
        }
        var result: [Repository] = []
        for dict in array {
            guard let id = dict["id"] as? Int,
                let name = dict["name"] as? String,
                let description = dict["description"] as? String,
                let htmlUrlString = dict["html_url"] as? String,
                let userDict = dict["owner"] as? NSDictionary,
                let ownerID = userDict["id"] as? Int,
                let ownerLogin = userDict["login"] as? String,
                let coverage = dict["coverage"] as? Double,
                let files = dict["files"] as? NSArray as? [String],
                let active = dict["active"] as? Bool
                else {
                    throw error
            }
            let optional = dict["optional"] as? String
            let optionalActive = dict["optionalActive"] as? Bool
            
            let owner = Owner(id: ownerID, login: ownerLogin)
            let repo = Repository(
                id: id,
                name: name,
                description: description,
                htmlUrlString : htmlUrlString,
                owner: owner,
                coverage: coverage,
                files: files,
                optional: optional,
                active: active,
                optionalActive: optionalActive)
            result.append(repo)
        }
        return result
    }
    
    func testDecodeRepositoryExampleShouldThrowMissingKeyException() {
        // given
        let json = readJsonFile("MissingKey.json")
        
        // when
        do {
            try Repository.decode(json)
        } catch DecodingError.MissingKey(let key, _) {
            // then
            XCTAssertEqual(key, "id")
        } catch let error as DecodingError {
            XCTFail("it should not throw \(error)")
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
        } catch DecodingError.TypeMismatch(let type, let info) {
            // then
            XCTAssertTrue(type == Int.self)
            XCTAssertEqual(info.formattedPath, "id")
        } catch {
            XCTFail("it should not throw this exception")
        }
    }
    
    func testDecodeRepositoryExampleNestedShouldThrowTypeMismatchException() {
        // given
        let json: NSDictionary = ["key": readJsonFile("TypeMismatch.json")]
        
        // when
        do {
            try parse(json, path: ["key"], decode: Repository.decode)
        } catch DecodingError.MissingKey {
            XCTFail("it should not throw this exception")
        } catch DecodingError.TypeMismatch(let type, let info) {
            // then
            XCTAssertTrue(type == Int.self)
            XCTAssertEqual(info.formattedPath, "key.id")
        } catch {
            XCTFail("it should not throw this exception")
        }
    }
    
    func testDecodeRepositoryExampleShouldThrowNoJsonObjectException() {
        // given
        let filePath = (NSBundle(forClass: object_getClass(self)).resourcePath! as NSString).stringByAppendingPathComponent("NoJsonObject.json")
        let jsonString = try! String(contentsOfFile: filePath)
        
        // when
        do {
            try Repository.decode(jsonString)
        } catch DecodingError.MissingKey {
            XCTFail("it should not throw this exception")
        } catch DecodingError.TypeMismatch(let type, let info) {
            XCTAssertEqual(info.path, [])
            XCTAssertTrue(type == NSDictionary.self)
            XCTAssertNotNil(info.object)
        } catch {
            XCTFail("it should not throw this exception")
        }
    }
}
