// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RatioHorizonalStack",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RatioHorizonalStack",
            targets: ["RatioHorizonalStack"]),
    ],
    dependencies: [
        .package(url: "https://github.com/stateman92/AdvancedGeometryReader.git", exact: .init(0, 0, 1))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RatioHorizonalStack",
            dependencies: [
                .product(name: "AdvancedGeometryReader", package: "AdvancedGeometryReader")
            ]
        ),
        .testTarget(
            name: "RatioHorizonalStackTests",
            dependencies: ["RatioHorizonalStack"]),
    ]
)
