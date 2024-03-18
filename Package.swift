// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XFWaterfallFlowView",
    platforms: [
        .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        .library(
            name: "XFWaterfallFlowView",
            targets: ["XFWaterfallFlowView"]),
    ],
    targets: [
        .target(
            name: "XFWaterfallFlowView"),
        .testTarget(
            name: "XFWaterfallFlowViewTests",
            dependencies: ["XFWaterfallFlowView"]),
    ]
)
