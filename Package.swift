// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NativeblocksWandkit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "NativeblocksWandkit",
            targets: ["NativeblocksWandkit"])
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandkit",
            path: "NativeblocksWandkit.xcframework")
    ]
)
