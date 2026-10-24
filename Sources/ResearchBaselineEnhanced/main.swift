import SwiftUI
import ResearchDesktop
@main struct ResearchBaselineEnhancedApp: App {
    @NSApplicationDelegateAdaptor(ResearchApplicationDelegate.self) private var applicationDelegate
    @StateObject private var model = AppModel(edition: .baselineEnhanced)
    var body: some Scene {
        WindowGroup("Research Baseline Enhanced") { BaselineView(model: model).task { applicationDelegate.bind(to: model); await model.open() } }
        .commands { ResearchCommands(model: model) }
    }
}
