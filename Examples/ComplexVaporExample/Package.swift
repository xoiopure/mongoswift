// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "ComplexVaporExample",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor", .upToNextMajor(from: "4.7.0")),
        .package(url: "https://github.com/vapor/leaf", .exact("4.0.0-rc.1.4")),
        .package(url: "https://github.com/mongodb/mongo-swift-driver", .branch("r1.0"))
    ],
    targets: [
        .target(
            name: "App",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Leaf", package: "leaf"),
                .product(name: "MongoSwift", package: "mongo-swift-driver")
            ]
        ),
        .target(name: "Run", dependencies: [
            .target(name: "App"),
            .product(name: "MongoSwift", package: "mongo-swift-driver")
        ])
    ]
)
