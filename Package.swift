// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwingAnimation",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SwingAnimation",
            targets: ["SwingAnimation"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/octree/ClockHandRotationKit", from: "1.0.1")
    ],
    targets: [
        .target(
            name: "SwingAnimation",
            dependencies: [
                "ClockHandRotationKit"
            ]
        ),
        .testTarget(
            name: "SwingAnimationTests",
            dependencies: ["SwingAnimation"]
        )
    ]
)
