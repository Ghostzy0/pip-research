import SwiftUI
import ResearchDesktop
@main struct ResearchBaselineEnhancedApp: App {
    @StateObject private var model = AppModel(edition: .baselineEnhanced)
    var body: some Scene {
        WindowGroup("Research Baseline Enhanced") { BaselineView(model: model).task { await model.open() } }
        .commands { ResearchCommands(model: model) }
    }
}
