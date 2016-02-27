//
//  File.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-02-27.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A]? {
    return try parse(json, path: path.toJSONPathArray(), decode: catchNull(decodeArray(A.decode)))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]? {
    return try parse(json, path: path.toJSONPathArray(), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> A? {
    return try parse(json, path: path.toJSONPathArray(), decode: catchNull(A.decode))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A?] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeArray(catchNull(A.decode)))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [[A]] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeArray(decodeArray(A.decode)))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> [A] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeArray(A.decode))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B?] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}
public func => <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}
public func => <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B] {
    return try parse(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}
public func => <A: Decodable>(json: AnyObject, path: String) throws -> A {
    return try parse(json, path: path.toJSONPathArray(), decode: A.decode)
}
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [A]?? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: catchNull(decodeArray(A.decode)))
}
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]?? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: catchNull(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> A?? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: catchNull(A.decode))
}
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [A?]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeArray(catchNull(A.decode)))
}
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [[A]]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeArray(decodeArray(A.decode)))
}
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [[A: B]]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeArray(decodeDictionary(A.decode, elementDecodeClosure: B.decode)))
}
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> [A]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeArray(A.decode))
}
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B?]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: catchNull(B.decode)))
}
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: [B]]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: decodeArray(B.decode)))
}
public func =>? <A: Decodable, B: Decodable, C: Decodable>(json: AnyObject, path: String) throws -> [A: [B: C]]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: decodeDictionary(B.decode, elementDecodeClosure: C.decode)))
}
public func =>? <A: Decodable, B: Decodable>(json: AnyObject, path: String) throws -> [A: B]? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: decodeDictionary(A.decode, elementDecodeClosure: B.decode))
}
public func =>? <A: Decodable>(json: AnyObject, path: String) throws -> A? {
    return try parseAndAcceptMissingKey(json, path: path.toJSONPathArray(), decode: A.decode)
}
