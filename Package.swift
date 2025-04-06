// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xcstrings-lint",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "XCStringsLint",
            targets: ["XCStringsLint"]),
    ],
    targets: [
        .executableTarget(
            name: "CommandLineTool",
            dependencies: ["XCStringsLint"]
        ),
        .target(
            name: "XCStringsLint"
        ),
        .testTarget(
            name: "XCStringsLintTests",
            dependencies: ["XCStringsLint"]
        ),
    ]
)
