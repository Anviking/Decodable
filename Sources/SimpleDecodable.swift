//
//  SimpleDecodable.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-07-04.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

/// Convenience protocol to aid transition from Decododable 0.x to 1.x
///
/// SimpleDecodable allows you to implement `decode(_:AnyObject)` instead
/// of `decode(_:DecodingContext<Void>)`
public protocol SimpleDecodable: Decodable {
    static func decode(_ json: AnyObject) throws -> Self
}

extension SimpleDecodable {
    static func decode(_ context: DecodingContext<Parameters>) throws -> Self {
        return try Self.decode(context.json)
    }
}
