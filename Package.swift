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
            targets: ["NativeblocksWandkit"])
    ],
     dependencies: [
        .package(url: "https://github.com/nativeblocks/nativeblocks-ios-sdk.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/AgoraIO/AgoraRtcEngine_iOS.git", .upToNextMajor(from: "4.4.0")),
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksWandkit",
            path: "NativeblocksWandkit.xcframework")
    ]
)
