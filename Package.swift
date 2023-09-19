// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftBackend",
    dependencies: [
        .package(url: "https://github.com/swift-cloud/Compute", from: "2.14.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "main.swift",
            dependencies: ["Compute"],
            path: "Sources"
        )
    ]
)
