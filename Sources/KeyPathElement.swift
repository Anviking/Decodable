//
//  KeyPathElement.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-29.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

// Keep it simple for now
public struct KeyPathElement {
    let key: String
    let optional: Bool
}

public func => (lhs: String, rhs: String) -> [KeyPathElement] {
    return [lhs, rhs].map { KeyPathElement(key: $0, optional: false) }
}

public func => (lhs: String, rhs: [KeyPathElement]) -> [KeyPathElement] {
    return [KeyPathElement(key: lhs, optional: false)] + rhs
}

