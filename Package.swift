// swift-tools-version:5.7
//  Package.swift
//  AdventOfCode
//
//  Created by Dash on 12/2/20.
//

import PackageDescription

let package = Package(
    name: "AdventOfCode",
    platforms: [
       .macOS(.v13),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
        .package(url: "https://github.com/apple/swift-algorithms.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .executableTarget(name: "AdventOfCode", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "Algorithms", package: "swift-algorithms"),
        ]),
    ]
)
