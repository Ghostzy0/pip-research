import SwiftUI
import ResearchDesktop
@main struct PipResearchEnhancedApp: App {
    @StateObject private var model = AppModel(edition: .pipEnhanced)
    var body: some Scene {
        WindowGroup("Pip Research Enhanced") { PipView(model: model).task { await model.open() } }
        .commands { ResearchCommands(model: model) }
    }
}
