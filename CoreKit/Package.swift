// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "CoreKitUI",
            targets: ["CoreKitUI"]),
        .library(
            name: "CKAuthentificationKit",
            targets: ["CKAuthentificationKit"]),
        .library(
            name: "ResourcesKit",
            targets: ["ResourcesKit"]),
    ],
    dependencies: [
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "CoreKitUI",
            dependencies: ["ResourcesKit"]),
        .target(
            name: "ResourcesKit",
            dependencies: []),
        .target(
            name: "CKAuthentificationKit",
            dependencies: []),

        .testTarget(
            name: "CoreKitUITests",
            dependencies: ["CoreKitUI"]),
        .testTarget(
            name: "ResourcesKitTests",
            dependencies: ["ResourcesKit"]),
        .testTarget(
            name: "CKAuthentificationKitTests",
            dependencies: ["CKAuthentificationKit"]),
    ]
)
