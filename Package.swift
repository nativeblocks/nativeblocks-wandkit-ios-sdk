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
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk.git", from: "1.2.0"),
        .package(url: "https://github.com/AgoraIO/AgoraRtcEngine_iOS.git", from: "4.5.0"),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandKit",
            path: "NativeblocksWandKit.xcframework"
        ),
        .target( 
            name: "NativeblocksWandKitPrivate",
            dependencies: [
                "NativeblocksWandKit",
                .product(name: "Nativeblocks", package: "nativeblocks-ios-sdk"),
                .product(name: "RtcBasic", package: "AgoraRtcEngine_iOS", condition: .when(platforms: [.iOS])),
                .product(name: "ReplayKit", package: "AgoraRtcEngine_iOS", condition: .when(platforms: [.iOS])),
            ],
            path: "./Sources/Empty"
        )
    ]
)
