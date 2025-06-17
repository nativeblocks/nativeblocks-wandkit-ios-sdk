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
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk", .upToNextMajor(from: "1.4.0")),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandKit",
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk/releases/download/1.0.4/NativeblocksWandKit.xcframework.zip",
            checksum: "85d4350460b614ce56e1116f23e240f4fed7500ca810bb9ada03a099e246dbdc"
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
