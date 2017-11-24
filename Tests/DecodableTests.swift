//
//  DecodableTests.swift
//  DecodableTests
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
import protocol Decodable.Decodable
import enum Decodable.DecodingError
import struct Decodable.KeyPath
@testable import Decodable

class DecodableTests: XCTestCase {
    
    private func readJsonFile(_ file: String) -> JSON {
        let filePath = (Bundle(for: object_getClass(self)!).resourcePath! as NSString).appendingPathComponent(file)
        let jsonString = try! String(contentsOfFile: filePath)
        let jsonData = jsonString.data(using: String.Encoding.utf8)!
		let dict = try! JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
        return JSON(object: dict)
    }
    
    func testDecodeRepositoryExampleShouldSuccess() {
        // given
        let json = readJsonFile("Repository.json")
        let dict = json.object as! NSDictionary
        
        // when
        do {
            let repository = try Repository.decode(json)
            // then
            XCTAssertEqual(repository.id, dict["id"] as? Int)
            XCTAssertEqual(repository.name, dict["name"] as? String)
            XCTAssertEqual(repository.description, dict["description"] as? String)
            XCTAssertEqual(repository.htmlUrlString, dict["html_url"] as? String)
            
            let owner = repository.owner
            let ownerDictionary = dict["owner"] as! NSDictionary
            XCTAssertEqual(owner.id, ownerDictionary["id"] as? Int)
            XCTAssertEqual(owner.login, ownerDictionary["login"] as? String)
            
            XCTAssertEqual(repository.coverage, dict["coverage"] as? Double)
            let files = repository.files
            XCTAssertEqual(files.count, 3)
            let array = dict["files"] as! Array<String>
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
    
    private let Count = 500
    
    func testDecodeArrayOfRepositoriesAndMeasureTime() {
        let json = readJsonFile("Repository.json")
        let array = NSArray(array: Array(repeating: json.object, count: Count))
        
        var result: [Repository] = []
        measure {
            do {
                result = try [Repository].decode(JSON(object: array))
            } catch let error {
                XCTFail("\(error)")
            }
        }
        XCTAssertEqual(result.count, Count)
    }
    
    func testCustomParseAndMeasureTime() {
        let json = readJsonFile("Repository.json")
        let array = NSArray(array: Array(repeating: json.object, count: Count))
        
        var result: [Repository] = []
        measure {
            do {
                result = try self.customParseRepository(JSON(object: array))
            } catch let error {
                XCTFail("\(error)")
            }
        }
        XCTAssertEqual(result.count, Count)
        
    }
    
    private func customParseRepository(_ j: JSON) throws -> [Repository] {
        let json = j.object
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
        let json = readJsonFile("missingKey.json")
        
        // when
        do {
            _ = try Repository.decode(json)
        } catch DecodingError.missingKey(let key, _) {
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
        let json = readJsonFile("typeMismatch.json")
        
        // when
        do {
            _ = try Repository.decode(json)
        } catch DecodingError.missingKey {
            XCTFail("it should not throw this exception")
        } catch let DecodingError.typeMismatch(expected, _, metadata) where expected == Int.self {
            // then
            XCTAssertEqual(metadata.formattedPath, "id")
        } catch let error {
            XCTFail("should not throw \(error)")
        }
    }
    
//    func testDecodeRepositoryExampleNestedShouldThrowTypeMismatchException() {
//        // given
//        let json: NSDictionary = ["key": readJsonFile("typeMismatch.json")]
//        
//        // when
//        do {
//            _ = (try parse(json, keyPath: ["key"], decoder: Repository.decode)) as Repository
//            
//        } catch DecodingError.missingKey {
//            XCTFail("it should not throw this exception")
//        } catch let DecodingError.typeMismatch(expected, _, metadata) where expected == Int.self {
//            // then
//            XCTAssertEqual(metadata.formattedPath, "key.id")
//        } catch let error {
//            XCTFail("should not throw \(error)")
//        }
//    }
//    
//    func testDecodeRepositoryExampleShouldThrowNoJsonObjectException() {
//        // given
//        let filePath = (Bundle(for: object_getClass(self)!).resourcePath! as NSString).appendingPathComponent("NoJsonObject.json")
//        let jsonString = try! String(contentsOfFile: filePath)
//        
//        // when
//        do {
//            _ = try Repository.decode(jsonString)
//        } catch DecodingError.missingKey {
//            XCTFail("it should not throw this exception")
//        } catch let DecodingError.typeMismatch(expected, _, metadata) where expected == NSDictionary.self {
//            XCTAssertEqual(metadata.path, [])
//            XCTAssertNotNil(metadata.object)
//        } catch {
//            XCTFail("should not throw \(error)")
//        }
//    }
}
