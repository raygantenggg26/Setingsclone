// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Setingsclone",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Setingsclone",
            targets: ["Setingsclone"]),
    ],
    targets: [
        .target(
            name: "Setingsclone",
            dependencies: [],
            resources: [
                .process("vpn_icon.png")
            ]
        )
    ]
)
