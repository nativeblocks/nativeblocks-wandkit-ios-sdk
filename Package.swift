// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NativeblocksWandKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "NativeblocksWandKit",
            targets: ["NativeblocksWandKitPrivate"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk", .upToNextMajor(from: "1.3.2")),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandKit",
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk/releases/download/1.0.1-SNAPSHOT/NativeblocksWandKit.xcframework.zip",
            checksum: "c711ea777791eda4f97939eb40deee1b4741a1c0e15d6049bbacc3ec09540123"
        ),
        .target( 
            name: "NativeblocksWandKitPrivate",
            dependencies: [
                "NativeblocksWandKit",
                .product(name: "Nativeblocks", package: "nativeblocks-ios-sdk"),
            ],
            path: "./Sources/Empty"
        )
    ]
)
