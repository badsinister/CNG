// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StoreKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "StoreKit", targets: ["StoreKit"]),
        .library(name: "RemoteSynchronizationKit", targets: ["RemoteSynchronizationKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.0"))
    ],
    targets: [
        .target(
            name: "StoreKit",
            dependencies: []),
        .target(
            name: "RemoteSynchronizationKit",
            dependencies: ["StoreKit", "ZIPFoundation"]),

        .testTarget(
            name: "StoreKitTests",
            dependencies: ["StoreKit"]),
        .testTarget(
            name: "RemoteSynchronizationKitTests",
            dependencies: ["RemoteSynchronizationKit", "StoreKit"]),
    ]
)
