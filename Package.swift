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
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk", .upToNextMajor(from: "1.8.0")),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandkit",
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk/releases/download/1.2.0/NativeblocksWandkit.xcframework.zip",
            checksum: "8e5e584fb331998b7ac869a9ddd6124724a0004bf6e6029a8fa3ee4368be3bbb"
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
