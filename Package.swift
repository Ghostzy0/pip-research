// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "PipResearch",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "ResearchBaselineEnhanced", targets: ["ResearchBaselineEnhanced"]),
        .executable(name: "PipResearch", targets: ["PipResearch"]),
        .executable(name: "PipResearchEnhanced", targets: ["PipResearchEnhanced"])
    ],
    targets: [
        .target(name: "ResearchCore"),
        .target(name: "ResearchDesktop", dependencies: ["ResearchCore"]),
        .executableTarget(name: "ResearchBaselineEnhanced", dependencies: ["ResearchDesktop"]),
        .executableTarget(name: "PipResearch", dependencies: ["ResearchDesktop"]),
        .executableTarget(name: "PipResearchEnhanced", dependencies: ["ResearchDesktop"]),
        .testTarget(name: "ResearchCoreTests", dependencies: ["ResearchCore"]),
        .testTarget(name: "ResearchDesktopTests", dependencies: ["ResearchDesktop", "ResearchCore"])
    ],
    swiftLanguageModes: [.v5]
)
