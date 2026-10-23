import SwiftUI
import ResearchDesktop
@main struct PipResearchApp: App {
    @StateObject private var model = AppModel(edition: .pip)
    var body: some Scene {
        WindowGroup("Pip Research") { PipView(model: model).task { await model.open() } }
        .commands { ResearchCommands(model: model) }
    }
}
