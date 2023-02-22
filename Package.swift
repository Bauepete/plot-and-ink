// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PlotAndInk",
    dependencies: [
        .package(url: "https://github.com/johnsundell/plot.git", .branch("master")),
        .package(url: "https://github.com/johnsundell/ink.git", .branch("master")),
        .package(url: "https://github.com/JohnSundell/Files", from: "4.0.4")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "PlotAndInk",
            dependencies: [
                .product(name: "Plot", package: "plot"),
                .product(name: "Ink", package: "ink"),
                .product(name: "Files", package: "Files")
            ]),
        .testTarget(
            name: "PlotAndInkTests",
            dependencies: ["PlotAndInk"]),
    ]
)
