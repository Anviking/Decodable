//
//  KeyPathElement.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-29.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

// Keep it simple for now
public struct OptionalKey {
    let key: String
    let optional: Bool
}

public func => (lhs: [OptionalKey], rhs: String) -> [OptionalKey] {
    return lhs + [OptionalKey(key: rhs, optional: false)]
}

public func =>? (lhs: [OptionalKey], rhs: String) -> [OptionalKey] {
    return lhs + [OptionalKey(key: rhs, optional: true)]
}

public func => (lhs: [String], rhs: String) -> [String] {
    return lhs + [rhs]
}

