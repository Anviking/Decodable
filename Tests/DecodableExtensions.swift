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
extension Int8: NSNumberCastable {}
extension Int16: NSNumberCastable {}
extension Int32: NSNumberCastable {}
extension Int64: NSNumberCastable {}
extension UInt8: NSNumberCastable {}
extension UInt16: NSNumberCastable {}
extension UInt32: NSNumberCastable {}
extension UInt64: NSNumberCastable {}

// URL and Date
extension URL: Decodable {}

extension Date: Decodable {
     public static func decode(_ json: Any) throws -> Date {
         return try iso8601DateFormatter.decode(json)
     }
 }
