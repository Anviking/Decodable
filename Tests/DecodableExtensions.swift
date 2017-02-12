import Foundation
import Decodable

// Castable provides a default Decodable implementation assuming the json object can be cast 
// using `json as? Self`
extension Bool: Castable {}
extension String: Castable {}
extension Double: Castable {}
extension Int: Castable {}

// NSNumberCastable provides a default Decodable implementation where the json object is first cast a NSNumber,
// then the raw value is accessed.
extension Int8: NSNumberCastable {}
extension Int16: NSNumberCastable {}
extension Int32: NSNumberCastable {}
extension Int64: NSNumberCastable {}
extension UInt8: NSNumberCastable {}
extension UInt16: NSNumberCastable {}
extension UInt32: NSNumberCastable {}
extension UInt64: NSNumberCastable {}

// Types conforming RawRepresentable (e.g enums) can be become Decodable with one line. URL is not RawRepresentable, though and
// making it that could lead to ambiguity if URL.init is accessed. Hence this extension is a little longer.
extension URL: Decodable {
    public static func decode(_ json: Any) throws -> URL {
        let string = try String.decode(json)
        guard let url = URL(string: string) else {
            let metadata = DecodingError.Metadata(object: json)
            throw DecodingError.rawRepresentableInitializationError(rawValue: string, metadata)
        }
        return url
    }
}

extension Date: Decodable {
     public static func decode(_ json: Any) throws -> Date {
         return try iso8601DateFormatter.decode(json)
     }
}
