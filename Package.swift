// swift-tools-version:5.5

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
  dependencies: [
    .package(
      name: "Introspect",
      url: "https://github.com/siteline/SwiftUI-Introspect.git",
      from: "0.1.3"
    ),
  ],
  targets: [
    .target(
      name: "Snappable",
      dependencies: ["Introspect"],
      path: "Sources"
    ),
    .testTarget(
      name: "SnappableTests",
      dependencies: ["Snappable"],
      path: "Tests"
    ),
  ]
)
