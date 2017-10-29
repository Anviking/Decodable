//
//  UnsafeKey.swift
//  Decodable
//
//  Created by Johannes Lund on 2017-10-29.
//  Copyright © 2017 anviking. All rights reserved.
//

import Foundation

struct UnsafeKey: CodingKey, ExpressibleByStringLiteral  {
    
    let stringValue: String
    
    init(stringLiteral value: String) {
        self.stringValue = value
    }
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    // MARK:-
    
    init?(intValue: Int) {
        return nil
    }
    
    var intValue: Int? { return nil }
    
}
