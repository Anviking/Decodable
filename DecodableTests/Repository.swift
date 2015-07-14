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
            optional: j => "optional"
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