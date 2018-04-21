// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CDKOraccInterface",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "CDKOraccInterface",
            targets: ["CDKOraccInterface"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/weichsel/ZIPFoundation/", .upToNextMajor(from: "0.9.0")),
        .package(url: "https://github.com/ckanchan/CDKSwiftOracc", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "CDKOraccInterface",
            dependencies: ["ZIPFoundation", "CDKSwiftOracc"]),
        .testTarget(
            name: "CDKOraccInterfaceTests",
            dependencies: ["CDKOraccInterface"]),
    ]
)
