//
//  DecodableExtensions.swift
//  Decodable
//
//  Created by Johannes Lund on 2017-02-12.
//  Copyright © 2017 anviking. All rights reserved.
//

import Foundation
import Decodable

// Castable types
extension Bool: Castable {}
extension String: Castable {}
extension Double: Castable {}
extension Int: Castable {}

// NSNumberCastable types
extension Int8: Decodable {}
extension Int16: Decodable {}
extension Int32: Decodable {}
extension Int64: Decodable {}
extension UInt8: Decodable {}
extension UInt16: Decodable {}
extension UInt32: Decodable {}
extension UInt64: Decodable {}

// URL and Date
extension URL: Decodable {}

extension Date: Decodable {
     public static func decode(_ json: Any) throws -> Date {
         return try iso8601DateFormatter.decode(json)
     }
 }
