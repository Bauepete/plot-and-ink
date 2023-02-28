// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PlotAndInk",
    products: [
        .library(
            name: "PlotAndInk",
            targets: ["PlotAndInk"]),
    ],
    dependencies: [
        .package(name: "Plot", url: "https://github.com/johnsundell/plot.git", from: "0.9.0"),
        .package(name: "Ink", url: "https://github.com/johnsundell/ink.git", from: "0.1.0"),
        .package(name: "Files", url: "https://github.com/johnsundell/files.git", from: "4.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PlotAndInk",
            dependencies: ["Plot", "Ink", "Files"]),
        .testTarget(
            name: "PlotAndInkTests",
            dependencies: ["PlotAndInk"]),
    ]
)
