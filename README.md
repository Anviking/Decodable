# Decodable
Simple yet powerful object mapping/JSON parsing using Swift 2's new error handling. Greatly inspired by [Argo](http://github.com/thoughtbot/Argo), but without any functional programming and bizillion operators.

Example:

```swift

struct Repository {
    let name: String
    let description: String
    let stargazersCount: Int
    let language: String?
    
    let owner: User
    let defaultBranch: Branch
    
    var fullName: String { return "\(owner.login)/\(name)" }
}

extension Repository: Decodable {
    static func decode(j: AnyObject) throws -> Repository {
        return try Repository(name: j => "name", description: j => "description", stargazersCount: j => "stargazers_count", language: j => "language", owner: j => "owner", defaultBranch: j => "default_branch")
    }
}


```
