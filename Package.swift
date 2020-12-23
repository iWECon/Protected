// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Protected",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "Protected",
            targets: ["Protected"]),
    ],
    targets: [
        .target(
            name: "Protected",
            dependencies: []),
        .testTarget(
            name: "ProtectedTests",
            dependencies: ["Protected"]),
    ]
)
