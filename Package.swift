// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OptionMenu",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "OptionMenu",
            targets: ["OptionMenu"]),
        
    ],
    dependencies: [
    .package(url: "https://github.com/marmelroy/Localize-Swift.git", .upToNextMajor(from: "3.1.0")),
    .package(url: "https://github.com/material-components/material-components-ios.git", .upToNextMajor(from: "109.8"))
    ],
    targets: [
        .target(
            name: "OptionMenu",
            path: "OptionMenu")
    ],
    swiftLanguageVersions: [.v5]
)
