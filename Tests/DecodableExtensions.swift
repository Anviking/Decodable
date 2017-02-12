//
//  DecodableExtensions.swift
//  Decodable
//
//  Created by Johannes Lund on 2017-02-12.
//  Copyright © 2017 anviking. All rights reserved.
//

import Foundation
import Decodable

extension URL: Decodable {}
extension Date: Decodable {
     public static func decode(_ json: Any) throws -> Date {
         return try iso8601DateFormatter.decode(json)
     }
 }
