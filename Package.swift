// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "ConcaveProgressView",
    platforms: [
      .iOS(.v13),
      .macOS(.v10_15),
      .watchOS(.v6),
      .tvOS(.v13)
    ],
    products: [
        .library(
            name: "ConcaveProgressView",
            targets: ["ConcaveProgressView"]
        ),
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "ConcaveProgressView",
            dependencies: []
        )
    ]
)
