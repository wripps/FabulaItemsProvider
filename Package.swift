// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FabulaItemsProvider",
    platforms: [
        .iOS(.v15),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FabulaItemsProvider",
            targets: ["FabulaItemsProvider"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .branch("master")),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", .branch("master")),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FabulaItemsProvider",
            dependencies: ["Alamofire",
                           "SDWebImage",
                           "SDWebImageSwiftUI"]),
        .testTarget(
            name: "FabulaItemsProviderTests",
            dependencies: ["FabulaItemsProvider"]),
    ]
)
