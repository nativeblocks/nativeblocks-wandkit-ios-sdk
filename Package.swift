// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NativeblocksWandkit",
    platforms: [.macOS(.v13), .iOS(.v15)],
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
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk/releases/download/1.1.1/NativeblocksWandkit.xcframework.zip",
            checksum: "b2e9cf8a5d4c8a29e8c43cfd8f2947a4ec6092b53036d02c67a6a0e77d0d2dd9"
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
