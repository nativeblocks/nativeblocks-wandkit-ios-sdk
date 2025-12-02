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
            targets: ["NativeblocksWandkitPrivate"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk", .upToNextMajor(from: "1.7.1")),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandkit",
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk/releases/download/1.1.0/NativeblocksWandkit.xcframework.zip",
            checksum: "5cb06c43059fe65e15afa0e5f5914b4d6077b825c7b06467d12b581905b1df66"
        ),
        .target(
            name: "NativeblocksWandkitPrivate",
            dependencies: [
                "NativeblocksWandkit",
                .product(name: "Nativeblocks", package: "nativeblocks-ios-sdk"),
            ],
            path: "./Sources/Empty"
        )
    ]
)
