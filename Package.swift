// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Package",
    products: [
        .library(
            name: "Package",
            targets: ["Package"]),
    ],
    targets: [

        .target(
            name: "Package"),

        .testTarget(
            name: "PackageTests",
            dependencies: ["Package"],
            resources: [.copy("Resources")]),
    ]
)
