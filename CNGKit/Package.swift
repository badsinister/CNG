// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "CNGKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(name: "CNGKitUI", targets: ["CNGKitUI"]),
        .library(name: "CNGShedulerKit", targets: ["CNGShedulerKit"]),
        .library(name: "CNGContactsKit", targets: ["CNGContactsKit"]),
        .library(name: "CNGOrganizationsKit", targets: ["CNGOrganizationsKit"]),
        .library(name: "CNGScenariosKit", targets: ["CNGScenariosKit"]),
        .library(name: "CNGLibraryKit", targets: ["CNGLibraryKit"]),
        .library(name: "CNGSynchronizationKit", targets: ["CNGSynchronizationKit"])
    ],
    dependencies: [
        .package(name: "CoreKit", path: "../CoreKit"),
        .package(name: "StoreKit", path: "../StoreKit")
    ],
    targets: [
        .target(
            name: "CNGKitUI",
            dependencies: ["StoreKit",
                           .product(name: "CoreKitUI", package: "CoreKit")]),
        .target(
            name: "CNGShedulerKit",
            dependencies: ["StoreKit",
                           "CNGKitUI",
                           .product(name: "CoreKitUI", package: "CoreKit")]),
        .target(
            name: "CNGContactsKit",
            dependencies: ["StoreKit",
                           "CNGKitUI",
                           "CNGShedulerKit",
                           .product(name: "CoreKitUI", package: "CoreKit")]),
        .target(
            name: "CNGOrganizationsKit",
            dependencies: ["StoreKit",
                           "CNGKitUI",
                           .product(name: "CoreKitUI", package: "CoreKit")]),
        .target(
            name: "CNGScenariosKit",
            dependencies: ["StoreKit",
                           "CNGKitUI",
                           .product(name: "CoreKitUI", package: "CoreKit")]),
        .target(
            name: "CNGLibraryKit",
            dependencies: ["StoreKit",
                           "CNGKitUI",
                           .product(name: "CoreKitUI", package: "CoreKit")]),
        .target(
            name: "CNGSynchronizationKit",
            dependencies: ["StoreKit",
                           "CNGKitUI",
                           .product(name: "CoreKitUI", package: "CoreKit")]),

        .testTarget(
            name: "CNGKitUITests",
            dependencies: ["CNGKitUI"]),
        .testTarget(
            name: "CNGShedulerKitTests",
            dependencies: ["CNGShedulerKit"]),
        .testTarget(
            name: "CNGContactsKitTests",
            dependencies: ["CNGContactsKit"]),
        .testTarget(
            name: "CNGOrganizationsKitTests",
            dependencies: ["CNGOrganizationsKit"]),
        .testTarget(
            name: "CNGScenariosKitTests",
            dependencies: ["CNGScenariosKit"]),
        .testTarget(
            name: "CNGLibraryKitTests",
            dependencies: ["CNGLibraryKit"]),
        .testTarget(
            name: "CNGSynchronizationKitTests",
            dependencies: ["CNGSynchronizationKit"])
    ]
)
