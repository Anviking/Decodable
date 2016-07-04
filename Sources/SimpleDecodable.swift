//
//  SimpleDecodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-04.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

public protocol SimpleDecodable: Decodable {
    static func decode(_ json: AnyObject) throws -> Self
}

extension SimpleDecodable {
    static func decode(_ context: DecodingContext<Parameters>) throws -> Self {
        return try Self.decode(context.json)
    }
}
