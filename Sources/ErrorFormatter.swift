//
//  ErrorFormatter.swift
//  Decodable
//
//  Created by Johannes Lund on 2016-09-20.
//  Copyright © 2016 anviking. All rights reserved.
//

import Foundation

extension String {
    var indented: String {
        return "  " + self.replacingOccurrences(of: "\n", with: "\n  ")
    }
    
    func replaceNewline(with string: String) -> String {
        return replacingOccurrences(of: "\n", with: string)
    }
}

/* TODO: Propagate errors through arrays
enum DebugKey {
    
    /// Dictionary/Object key
    case key(String)
    
    /// Array index
    case index(Int)
    
    var key: String? {
        switch self {
        case .key(let key):
            return key
        default:
            return nil
        }
    }
    
    var index: Int? {
        switch self {
        case .index(let index):
            return index
        default:
            return nil
        }
    }
}

extension DebugKey: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .key(value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String) {
        self = .key(value)
    }
    
    public init(unicodeScalarLiteral value: String) {
        self = .key(value)
    }
}

extension DebugKey: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .index(value)
    }
    
}
*/
/// Sorry. /Past me
struct JSONErrorFormatter {
    var path: [String]
    let message: String
    
    mutating func format(json: Any) -> String {
        var result = ""
        switch json {
        case let json as NSDictionary:
            
            for (key, value) in json {
                result.append("\n")
                
                // Check if key matches first item in `path`.
                var highlightMatch = false
                var isFinalKey = false
                //if let a = (key as? String), let b = path.first?.key, a == b {
                if let a = (key as? String), let b = path.first, a == b {
                    highlightMatch = true
                    path.removeFirst()
                }
                
                if path.count == 0 && highlightMatch {
                    isFinalKey = true
                }
                
                var formattedValue = format(json: value)
                let formattedKey = "\(key)"
                
                switch (highlightMatch, formattedValue.contains("\n")) {
                case (true, true):
                    formattedValue = formattedValue.replaceNewline(with: "\n | ")
                case (false, true):
                    formattedValue = formattedValue.replaceNewline(with: "\n   ")
                default:
                    break
                }
                
                if isFinalKey {
                    var lines = formattedValue.components(separatedBy: "\n")
                    if lines.count > 0 {
                        lines[0] = lines[0] + " <<<<---- \(message)"
                    }
                    formattedValue = lines.joined(separator: "\n")
                }
                
                result.append("\(formattedKey): \(formattedValue)")
                
                
            }
            
        case let json as [Any]:
            
            var items: [String] = []
            result.append("\n")
            for (index, value) in json.enumerated() {
                
                print(index)
                // Check if key matches first item in `path`.
                /*
                var highlightMatch = false
                var isFinalKey = false
                
                if let i = path.first?.index, index == i {
                    highlightMatch = true
                    path.removeFirst()
                }
 
                if path.count == 0 && highlightMatch {
                    isFinalKey = true
                }
                 */
                var formattedValue = format(json: value)
                /*
                
                
                if isFinalKey {
                    var lines = formattedValue.components(separatedBy: "\n")
                    if lines.count > 0 {
                        lines[0] = lines[0] + " <<<<---- \(message)"
                    }
                    formattedValue = lines.joined(separator: "\n")
                }
                */
                formattedValue = formattedValue.indented
                 /*
                if highlightMatch {
                    formattedValue = formattedValue.replacingOccurrences(of: "\n", with: "\n |")
                }
                */
                items.append("[\(index)] \(formattedValue)")
            }
            result.append(items.joined(separator: "\n"))
        case let json as String:
            return "\"\(json)\""
        default:
            result += "\(json)"
        }
        
        return result
    }
}
