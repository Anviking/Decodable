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
By using this operator in a variety of forms.
```swift
func => <T: Decodable>(json: AnyObject, key: String) throws -> T
```

There are also overloads for returning T?, [String: AnyObject], [T] and [T]?.

## Flexibility
The `Decodable`-protocol and the `=>`-operator should in no way make you committed to use them everywhere.

For example you could...

- Skip adapting the `Decodable` protocol, and parse things differently depending on the context (like `defaultBranch` in the example code).

- Create your own throwing parsing-functions, e.g for `NSDate`-parsing.

### Arrays
The default behaviour for array decoding is to throw if one element throws. The special operator `=>?` will catch errors when decoding elements in an array and filter out faulty objects.
