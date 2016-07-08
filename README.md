# Decodable
Simple yet powerful object mapping made possible by Swift 2's new error handling. Greatly inspired by [Argo](http://github.com/thoughtbot/Argo), but without a bizillion functional operators.

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods version](https://cocoapod-badges.herokuapp.com/v/Decodable/badge.png)](https://cocoapods.org/pods/Decodable)
[![Platforms](https://cocoapod-badges.herokuapp.com/p/Decodable/badge.png
)](https://cocoadocs.org/docsets/NSStringMask)
[![Travis](https://img.shields.io/travis/Anviking/Decodable/master.svg)](https://travis-ci.org/Anviking/Decodable/branches)

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
                    name: j => "nested" => "name", 
                    description: j => "description", 
                    stargazersCount: j => "stargazers_count", 
                    language: j => "language", 
                    sometimesMissingKey: j =>? "sometimesMissingKey",
                    owner: j => "owner", 
                    defaultBranch: Branch(name: j => "default_branch")
                )
    }
}

do {
    let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
    let repo = try [Repository].decode(json)
} catch {
    print(error)
}
```
#### Compitability

| Swift version | Compitable tag or branch |
| --- | --- |
| Swift 3.0 | `master`|
| Swift 2.3 | `swift-2.3` |
| Swift 2.2 | `v0.4.3`|

### Features
- Informative errors
- Decoding depends on inferred type
- Leverages Swift 2's error handling
- There is no trickery in decoding e.g an array of optionals `[T?]`. It's just the same, you don't have to do anything.
- Does not work by "mapping". You should be very flexible, not commited to this library.

### What it doesn't do
- Encoding
- Force you to have optional and/or `var` properties

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

### And shameless operator-overloading
The (326!) generated overloads, all calling the `parse`-function, can be found in [Overloads.swift](https://github.com/Anviking/Decodable/blob/master/Sources/Overloads.swift). Return types include `T?`, `[T?]`, `[T?]?`, `AnyObject` and `[String: T]?`. Swift 3 generics will most likely reduce the overloads required, remove need for code generation, and enable automagic decoding to infinitly nested generic types (like `[[[[[[[[[A???]]: B]]]?]]?]]`).

An overload may look like this:
```swift
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T
```

There are also overloads that enable natural access to nested keys like `json => "a" => "b" => "c"`:
```swift
public func => (lhs: String, rhs: String) -> [String]
public func => <T: Decodable>(lhs: AnyObject, rhs: [String]) throws -> T
```

## Errors
`ErrorTypes` conforming to `DecodingError` will be caught and rethrown in the decoding process to set metadata, like the JSON object that failed decoding, the key path to it, and the root JSON object. There are currently three error-structs conforming to it:
- `TypeMismachError`
- `MissingKeyError`
- `RawRepresentableInitializationError`

```swift
let dict: NSDictionary = ["object": ["repo": ["owner": ["id" : 1, "login": "anviking"]]]]

do {
    let username: String = try dict => "object" => "repo" => "owner" => "name"
} catch let error {
    print(error)
}
//
// MissingKeyError at object.repo.owner: name in {
//    id = 1;
//    login = anviking;
// }
```

## Handling Errors
Expressions like `j => "key"` will throw directly, and `catch`-statements can be used to create the most complex error handling behaviours. This also means that `try?` can be used to return nil if *anything* goes wrong instead of throwing.

For convenience there is an operator, `=>?`, that only returns nil on missing keys, for APIs that indicate `null` in that manner, and to aid working with different response formats.

| Overload | Null Behaviour | Missing Key Behavior  |Type Mismatch Behaviour | Errors in subobjects | 
| ------------- |:-------------:|:-----:|:-----:|:-----:|
|  `=> -> T`| throws | throws | throws | uncaught (throws) | 
|  `=> -> T?`| nil | throws | throws | uncaught (throws) | 
|  `=>? -> T?`| nil | nil | throws | uncaught (throws) | 
|  `try? => -> T `| nil | nil | nil | caught (nil) | 

#### Note about nested keys and the `=>?` operator
Currently, either all keys in an expression throw on a missing key or none of them do.
```swift
let a: Int = try json => "user" => "followers" // Will throw if either key is missing
let b: Int = try json =>? "user" => "followers" // Won't throw if either key is missing
let c: Int = try json => "user" =>? "followers" // Won't compile
```
This is controlled by the left most operator (where the actual decoding happens). Subsequent `=>` only append keys to an array, and do not affect anything else.

This might be addressed in the future by #77.

## Tips
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
