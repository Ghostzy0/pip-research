import SwiftUI
import ResearchDesktop
@main struct PipResearchApp: App {
    @NSApplicationDelegateAdaptor(ResearchApplicationDelegate.self) private var applicationDelegate
    @StateObject private var model = AppModel(edition: .pip)
    var body: some Scene {
        WindowGroup("Pip Research") { PipView(model: model).task { applicationDelegate.bind(to: model); await model.open() } }
        .commands { ResearchCommands(model: model) }
    }
}
