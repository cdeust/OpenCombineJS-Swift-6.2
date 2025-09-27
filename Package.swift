// swift-tools-version:6.2
import PackageDescription
let package = Package(
  name: "OpenCombineJS",
  platforms: [
    .macOS("26.0")
  ],
  products: [
    .executable(name: "OpenCombineJSExample", targets: ["OpenCombineJSExample"]),
    .library(name: "OpenCombineJS", targets: ["OpenCombineJS"]),
  ],
  dependencies: [
    .package(url: "https://github.com/swiftwasm/JavaScriptKit.git", from: "0.13.0"),
    .package(url: "https://github.com/OpenCombine/OpenCombine.git", from: "0.13.0"),
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
        "JavaScriptKit", "OpenCombine",
      ]
    ),
  ]
)
