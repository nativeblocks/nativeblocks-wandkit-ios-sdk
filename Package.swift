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
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk", .upToNextMajor(from: "1.3.1")),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandKit",
            path: "./NativeblocksWandKit.xcframework"
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
