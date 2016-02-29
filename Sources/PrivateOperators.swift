//
//  PrivateOperators.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-27.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

infix operator |>   { precedence 50 associativity left }
infix operator |>?  { precedence 50 associativity left }

func |> <T,U>(lhs: T, rhs: T -> U) -> U {
    return rhs(lhs)
}

func |> <T,U>(lhs: T, rhs: T throws -> U) throws -> U {
    return try rhs(lhs)
}

func |> <T,U>(lhs: T?, rhs: T throws -> U) throws -> U? {
    return try lhs.flatMap { try rhs($0) }
}

func |> <T,U>(lhs: T?, rhs: T throws -> U?) throws -> U? {
    return try lhs.flatMap { try rhs($0) }
}

func |>? <T,U>(lhs: T, rhs: T throws -> U) throws -> U? {
    return try? rhs(lhs)
}
