//
//  Extensions.swift
//  Decodable
//
//  Created by Johannes Lund on 2017-02-12.
//  Copyright © 2017 anviking. All rights reserved.
//

import Foundation

// MARK: URLs

extension URL: RawRepresentable {
    public init?(rawValue: String) {
        self.init(string: rawValue)
    }
    
    public var rawValue: String {
        return self.absoluteString
    }
}

// MARK: Dates

private let iso8601DateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    return formatter
}()


extension DateFormatter {
    /// Cast json to string and convert to a Date
    ///
    /// - throws: DecodingError.rawRepresentableInitializationError if the string can't be converted to a Date.
    func decode(_ json: Any) throws -> Date {
        let string = try String.decode(json)
        guard let date = self.date(from: string) else {
            let metadata = DecodingError.Metadata(object: json)
            throw DecodingError.rawRepresentableInitializationError(rawValue: string, metadata)
        }
        return date
    }
}
