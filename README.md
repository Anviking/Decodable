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
                    name:                   j => "name", 
                    description:            j => "description", 
                    stargazersCount:        j => "stargazers_count", 
                    language:               j => "language", 
                    sometimesMissingKey:    j =>? "sometimesMissingKey",
                    owner:                  j => "owner", 
                    defaultBranch:          Branch(name: j => "default_branch")
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

### And shameless operator-overloading
The overloads, all calling the `parse`-function, can be found in [Operators.swift](https://github.com/Anviking/Decodable/blob/master/Sources/Operators.swift)

An overload may look like this:
```swift
public func => <T: Decodable>(lhs: AnyObject, rhs: String) throws -> T
```

Then there are also overloads for returning `T?`, `[T?]`, `[T?]?`, `AnyObject`, `[String: T]?` and more. 

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
