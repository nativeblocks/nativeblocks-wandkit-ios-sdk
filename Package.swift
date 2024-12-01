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
            url: "https://github.com/nativeblocks/nativeblocks-wandkit-ios-sdk/blob/main/NativeblocksWandkit.xcframework.zip",
            checksum: "a901c9afe97af39f4f985fdd46200cc65ea4c61216d8fc93b087efb65f5f515debc5d5a3d92476b946d9ac9e99d39190808236c4415a78c6a6801bd594b77a9c"
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
