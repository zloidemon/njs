// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "NJS",
    products: [
        .library(name: "NJS", targets: ["NJS"]),
    ],
    dependencies: [
        .package(
             url: "https://github.com/swiftstack/javascript.git",
             .branch("dev")),
        .package(
            url: "https://github.com/swiftstack/test.git",
            .branch("fiber"))
    ],
    targets: [
        .target(
            name: "CNJS",
            dependencies: []),
        .target(
            name: "NJS",
            dependencies: ["CNJS", "JavaScript"]),
        .testTarget(
            name: "NJSTests",
            dependencies: ["Test", "NJS"]),
    ]
)
