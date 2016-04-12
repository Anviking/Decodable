//
//  DecodableTests.swift
//  DecodableTests
//
//  Created by Johannes Lund on 2015-07-08.
//  Copyright © 2015 anviking. All rights reserved.
//

import XCTest
@testable import Decodable

class DecodeAsOneOfTests: XCTestCase {
    
    private func readJsonFile(file: String) -> NSDictionary {
        let filePath = (NSBundle(forClass: object_getClass(self)).resourcePath! as NSString).stringByAppendingPathComponent(file)
		print(filePath)
        let jsonString = try! String(contentsOfFile: filePath)
        let jsonData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)!
        return try! NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
    }
    
    func testDecodingSubtypesShouldSucceed() {
        // given
        let json = readJsonFile("Vehicle.json")
        
        // when
        do {
			
			let vehiclesRaw: AnyObject = try json => "vehicles"
			
			let vehicles1 = try decodeArrayAsOneOf(vehiclesRaw, objectTypes: Train.self, Truck.self, Car.self)
			
			guard let vehiclesArray = vehiclesRaw as? [AnyObject] else {
				throw TypeMismatchError(expectedType: NSArray.self, receivedType: Mirror(reflecting: vehiclesRaw).subjectType, object: vehiclesRaw)
			}
			
			let vehicles2 = try vehiclesArray.map { try decodeAsOneOf($0, objectTypes: Train.self, Truck.self, Car.self) }
			
			XCTAssertEqual(vehicles1.count, vehicles2.count)
			XCTAssertEqual(vehicles1.count, vehiclesArray.count)
			for truck in vehicles1.flatMap({ $0 as? Truck }) {
				XCTAssertEqual(truck.wheels, 18)
			}
			
			let train = vehicles1.flatMap { $0 as? Train }.first!
			XCTAssertEqual(train.electric, true)
			
        } catch {
            XCTFail("it should not throw an exception")
        }
    }
}
