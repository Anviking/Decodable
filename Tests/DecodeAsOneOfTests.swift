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
    
    private func readJsonFile(_ file: String) -> NSDictionary {
        let filePath = (Bundle(for: object_getClass(self)).resourcePath! as NSString).appendingPathComponent(file)
		print(filePath)
        let jsonString = try! String(contentsOfFile: filePath)
		let jsonData = jsonString.data(using: String.Encoding.utf8)!
		return try! JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
    }
    
    func testDecodingSubtypesShouldSucceed() {
        // given
        let json = readJsonFile("Vehicle.json")
        
        // when
        do {
			
			let vehiclesRaw: Any = try json => "vehicles"
			
			let vehicles1 = try decodeArrayAsOneOf(vehiclesRaw, objectTypes: Train.self, Truck.self, Car.self)
			
			guard let vehiclesArray = vehiclesRaw as? [Any] else {
                let metadata = DecodingError.Metadata(object: vehiclesRaw)
				throw DecodingError.typeMismatch(expected: NSArray.self, actual: Mirror(reflecting: vehiclesRaw).subjectType, metadata)
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
