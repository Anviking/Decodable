//
//  RepositoryExample.swift
//  Decodable
//
//  Created by Fran_DEV on 13/07/15.
//  Copyright © 2015 anviking. All rights reserved.
//

import Foundation
@testable import Decodable

struct Owner {
    let id: Int
    let login: String
}

struct Repository {
    let id: Int
    let name: String
    let description: String
    let htmlUrlString : String
    let owner: Owner // Struct conforming to Decodable
    let coverage: Double
    let files: Array<String>
    let optional: String?
    let active: Bool
    let optionalActive: Bool?
}

extension Owner : Decodable {
    static func decode(j: AnyObject) throws -> Owner {
        return try Owner(
            id: j => "id",
            login: j => "login"
        )
    }
}

extension Repository : Decodable {
    static func decode(j: AnyObject) throws -> Repository {
        return try Repository(
            id: j => "id",
            name: j => "name",
            description: j => "description",
            htmlUrlString : j => "html_url",
            owner: j => "owner",
            coverage: j => "coverage",
            files: j => "files",
            optional: j => "optional",
            active: j => "active",
            optionalActive: j => "optionalActive"
        )
    }
}

// MARK: Equatable

func == (lhs: Owner, rhs: Owner) -> Bool {
    return lhs.id == rhs.id && lhs.login == rhs.login
}

extension Owner: Equatable {
    var hashValue: Int { return id.hashValue }
}

func == (lhs: Repository, rhs: Repository) -> Bool {
    return lhs.id == rhs.id &&
    lhs.name == rhs.name &&
    lhs.description == rhs.description &&
    lhs.htmlUrlString == rhs.htmlUrlString &&
    lhs.owner == rhs.owner &&
    lhs.coverage == rhs.coverage &&
    lhs.files == rhs.files &&
    lhs.optional == rhs.optional &&
    lhs.active == rhs.active &&
    lhs.optionalActive == rhs.optionalActive
}

extension Repository: Equatable {
    var hashValue: Int { return id.hashValue }
}