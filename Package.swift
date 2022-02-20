// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Snappable",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "Snappable",
      targets: ["Snappable"]
    ),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Snappable",
      dependencies: [],
      path: "Sources"
    ),
    .testTarget(
      name: "SnappableTests",
      dependencies: ["Snappable"],
      path: "Tests"
    ),
  ]
)
