//
//  PlsFixSwift.swift
//  Decodable
//
//  Created by FJBelchi on 2015-07-24.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation

extension Array where Element: Decodable {
    
    public static func decode(json: AnyObject) throws -> Array<Element> {
        guard let array = json as? [AnyObject] else {
            let info = DecodingError.Info(object: json)
            throw DecodingError.TypeMismatch(type: self, info: info)
        }
        
        var newArray = [Element]()
        for obj in array {
            do {
                try newArray.append(Element.decode(obj))
            } catch let error {
                print("Caught an error: \(error)")
            }
        }
        
        return Array(newArray)
    }
}
