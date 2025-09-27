// swift-tools-version:6.2
import PackageDescription
let package = Package(
  name: "OpenCombineJS-Swift-6.2",
  platforms: [
    .macOS("26.0")
  ],
  products: [
    .executable(name: "OpenCombineJSExample", targets: ["OpenCombineJSExample"]),
    .library(name: "OpenCombineJS", targets: ["OpenCombineJS"]),
  ],
  dependencies: [
    .package(path: "../JavaScriptKit-Swift-6.2"),
    .package(path: "../OpenCombine-Swift-6.2"),
  ],
  targets: [
    .executableTarget(
      name: "OpenCombineJSExample",
      dependencies: [
        "OpenCombineJS",
      ]
    ),
    .target(
      name: "OpenCombineJS",
      dependencies: [
        .product(name: "JavaScriptKit", package: "JavaScriptKit-Swift-6.2"),
        .product(name: "OpenCombine", package: "OpenCombine-Swift-6.2"),
      ]
    ),
  ]
)
