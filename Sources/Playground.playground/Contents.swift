//: Playground - noun: a place where people can play

infix operator => { associativity left precedence 150 }
infix operator =>? { associativity left precedence 150 }

protocol Foo {
    func foo() -> String
}

