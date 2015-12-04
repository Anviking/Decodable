# Decodable
Simple yet powerful object mapping made possible by Swift 2's new error handling. Greatly inspired by [Argo](http://github.com/thoughtbot/Argo), but without a bizillion functional operators.

## Example:

```swift

struct Repository {
    let name: String
    let description: String
    let stargazersCount: Int
    let language: String?
    let sometimesMissingKey: String?
    
    let owner: User // Struct conforming to Decodable
    let defaultBranch: Branch // Struct NOT conforming to Decodable
    
    var fullName: String { return "\(owner.login)/\(name)" }
}

extension Repository: Decodable {
    static func decode(j: AnyObject) throws -> Repository {
        return try Repository(
                    name: j => "name", 
                    description: j => "description", 
                    stargazersCount: j => "stargazers_count", 
                    language: j => "language", 
                    sometimesMissingKey: try? j => "sometimesMissingKey",
                    owner: j => "owner", 
                    defaultBranch: Branch(name: j => "default_branch")
                )
    }
}
```

## How does it work?

### A protocol
```swift
public protocol Decodable {
    static func decode(json: AnyObject) throws -> Self
}
```
### A parse-function
```swift
public func parse<T>(json: AnyObject, path: [String], decode: (AnyObject throws -> T)) throws -> T
```

### A lot of operator-overloads
which call the `parse`-function.
```swift
/// Try to decode as T, or throw
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T

/// Do not decode. Without an inferred return type, this overload will be called.
public func => (lhs: AnyObject, rhs: String) throws -> AnyObject

/// Try to decode as T, or throw. Will return nil if the object at the keypath is NSNull.
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T?

// MARK: Arrays

/// Try to decode as NSArray, and decode each element as T. Will throw if decoding of any element in the array throws. I.e, if one element is faulty the entire array is "thrown away".
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]

/// Try to decode as NSArray, and decode each element as T. Will return nil if the object at the keypath is NSNull. Will throw if decoding of any element in the array throws. I.e, if one element is faulty the entire array is "thrown away".
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]?

/// Try to decode as NSArray, and decode each element as T or nil, if the element is NSNull.
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T?]

/// Enables parsing nested objects e.g json => "a" => "b"
/// Uses \u{0} (null) as a separator
public func => (lhs: String, rhs: String) -> String
```

## Errors
```swift
public enum DecodingError {
    public struct Info {
        var path: [String]
        var object: AnyObject?
        var rootObject: AnyObject?
    }
    
    case MissingKey(key: String, info: Info)
    case TypeMismatch(type: Any.Type, info: Info)
}
```

Example:

```swift
let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": "anviking"]]]]

do {
    let username: String = try dict => "object" => "repo" => "owner" => "lllloogon"
} catch let error {
    print(error)
}

===============================
MissingKey at object.repo.owner: lllloogon in {
    id = 1;
    login = anviking;
}
```

## Tips
- You can use `try? json => "key"`
- You can use `Decodable` with classes. Just make sure to either call a `required` initializer on self (e.g `self.init`) and return `Self`, or make your class `final`. ( [This](http://stackoverflow.com/questions/26495586/best-practice-to-implement-a-failable-initializer-in-swift) might be a problem though)
- The `Decodable`-protocol and the `=>`-operator should in no way make you committed to use them everywhere.

For example you could...

- Skip adapting the `Decodable` protocol, and parse things differently depending on the context (like `defaultBranch` in the example code).
- Make your own protocols!
- Create your own throwing decode-functions, e.g for `NSDate`, or convenience-extensions with your own date-formatter.
```swift
public class func decode(json: AnyObject) throws -> Self {
        let string = try String.decode(json)

        guard let date = ISO8601DateFormatter.dateFromString(string) else {
            throw NSDateDecodingError.InvalidStringFormat
        }

        return self.init(timeIntervalSince1970: date.timeIntervalSince1970)
}
```
