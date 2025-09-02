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
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk", .upToNextMajor(from: "1.5.0")),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandKit",
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk/releases/download/1.0.6/NativeblocksWandKit.xcframework.zip",
            checksum: "ca9f7e40ab045321bd4a35d4899e96e330da50874faed9ef1a2b775d16c4f4c5"
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
