import SwiftUI
import ResearchDesktop
struct PipResearchApp: App {
    @NSApplicationDelegateAdaptor(ResearchApplicationDelegate.self) private var applicationDelegate
    @StateObject private var model = AppModel(edition: .pip)
    var body: some Scene {
        WindowGroup("Pip Research") { PipView(model: model).task { applicationDelegate.bind(to: model); await model.open() } }
        .commands { ResearchCommands(model: model) }
    }
}

@main enum PipResearchEntryPoint {
    @MainActor static func main() {
        ResearchApplication.prepareBeforeSwiftUI()
        PipResearchApp.main()
    }
}
