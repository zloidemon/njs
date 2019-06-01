// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "NJS",
    products: [
        .library(name: "NJS", targets: ["NJS"]),
    ],
    dependencies: [
         .package(
             url: "https://github.com/tris-code/javascript.git",
             .branch("master")),
        .package(
            url: "https://github.com/tris-code/test.git",
            .branch("master"))
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
