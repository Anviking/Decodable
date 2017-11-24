//
//  JSON.swift
//  Decodable
//
//  Created by Johannes Lund on 2017-11-24.
//  Copyright © 2017 anviking. All rights reserved.
//

import Foundation

public struct JSON {
    var object: Any
}

extension JSON: Decodable {
    public static func decode(_ json: JSON) throws -> JSON {
        return json
    }
}
