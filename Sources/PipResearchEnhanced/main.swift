import SwiftUI
import ResearchDesktop
@main struct PipResearchEnhancedApp: App {
    @NSApplicationDelegateAdaptor(ResearchApplicationDelegate.self) private var applicationDelegate
    @StateObject private var model = AppModel(edition: .pipEnhanced)
    var body: some Scene {
        WindowGroup("Pip Research Enhanced") { PipView(model: model).task { applicationDelegate.bind(to: model); await model.open() } }
        .commands { ResearchCommands(model: model) }
    }
}
