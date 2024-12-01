// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NativeblocksWandkit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "NativeblocksWandkit", targets: ["Wandkit", "nativeblocks-ios-sdk", "AgoraRtcEngine_iOS"]),
    ],
     dependencies: [
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk.git", from: "1.2.0"),
        .package(url: "https://github.com/AgoraIO/AgoraRtcEngine_iOS.git", from: "4.5.0"),
    ],
    targets: [
        .binaryTarget(
            name: "Wandkit",
            url: "https://nativeblocks.io/download/ios/NativeblocksWandkit.xcframework.zip",
            checksum: "1d02b42051ccfc38be8dc8db04e181d7bb7d86aefebacd8a83875c8bc541fa14"
        ),
        .target(
            name: "nativeblocks-ios-sdk",
            dependencies: [
                .product(name: "nativeblocks-ios-sdk", package: "nativeblocks-ios-sdk")
            ]
        ),
        .target(
            name: "AgoraRtcEngine_iOS",
            dependencies: [
                .product(name: "AgoraRtcEngine_iOS", package: "AgoraRtcEngine_iOS")
            ]
        )
    ]
)
