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
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk", .upToNextMajor(from: "1.7.0")),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandkit",
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk/releases/download/1.0.7/NativeblocksWandkit.xcframework.zip",
            checksum: "2bc6f1a7be20c18dce385a46bf8a200d50b723d6cf74b6b7a26d31aa69b5d88b"
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
