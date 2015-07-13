//
//  DecodableTests.swift
//  DecodableTests
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest

class DecodableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDecodeRepositoryExampleShouldSuccess() {
        // given
        let json = readJsonFile("repository.json")
    
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
        } catch {
            XCTFail("it should throw an exception")
        }
    }
    
    private func readJsonFile(file: String) -> NSDictionary {
        let filePath = NSBundle(forClass: object_getClass(self)).resourcePath!.stringByAppendingPathComponent(file)
        let jsonString = try! String(contentsOfFile: filePath)
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)!
        return try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
    }
    
}
