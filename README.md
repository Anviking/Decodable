# Decodable
Simple yet powerful object mapping made possible by Swift 2's new error handling. Greatly inspired by [Argo](http://github.com/thoughtbot/Argo), but without any functional programming and bizillion operators.

## Example:

```swift

struct Repository {
    let name: String
    let description: String
    let stargazersCount: Int
    let language: String?
    
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
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T?
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]?
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T?]
public func => (lhs: AnyObject, rhs: String) throws -> NSDictionary

public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) throws -> [T]
public func =>? <T: Decodable>(lhs: AnyObject, rhs: String) -> T?

// Enables parsing nested objects e.g json => "a" => "b"
// Uses \u{0} as a separator
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

## Flexibility
The `Decodable`-protocol and the `=>`-operator should in no way make you committed to use them everywhere.

For example you could...

- Skip adapting the `Decodable` protocol, and parse things differently depending on the context (like `defaultBranch` in the example code).

- Create your own throwing decode-functions, e.g for `NSDate`.

### Arrays
The default behaviour for array decoding is to throw if one element throws. The special operator `=>?` will catch errors when decoding elements in an array and filter out faulty objects.
