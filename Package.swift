// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "Decodable",
    products: [
        .library(name: "Decodable", targets: ["Decodable"])
    ],
    targets: [
        .target(name: "Decodable", path: "Sources"),
        .testTarget(name: "DecodableTests", dependencies: ["Decodable"], path: "Tests")
    ]
)
