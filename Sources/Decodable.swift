//
//  Decodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2015-07-07.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

public protocol Decodable {
    static func decode(_ json: Any) throws -> Self
}


extension Dictionary where Key: Decodable, Value: Decodable {
    public static func decode(_ j: Any) throws -> Dictionary {
        return try Dictionary.decoder(key: Key.decode, value: Value.decode)(j)
    }
}

/* FIXME: this causes ambiguity issues, in the meantime resort to `Dictionary.decoder`
 https://github.com/Anviking/Decodable/issues/120
 
extension Dictionary where Key: Decodable, Value: Any {
    
    public static func decode(_ j: Any) throws -> Dictionary {
        let valueDecoder: (Any) throws -> Value = { try cast($0) }
        return try Dictionary.decoder(key: Key.decode, value: valueDecoder)(j)
    }
}
*/

extension Array where Element: Decodable {
    public static func decode(_ j: Any, ignoreInvalidObjects: Bool = false) throws -> [Element] {
        if ignoreInvalidObjects {
            return try [Element?].decoder { try? Element.decode($0) }(j).flatMap {$0}
        } else {
            return try Array.decoder(Element.decode)(j)
        }
    }
}

