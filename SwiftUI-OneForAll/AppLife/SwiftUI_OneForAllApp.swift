//
//  SwiftUI_OneForAllApp.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_OneForAllApp: App {

    let modelContainer = try! ModelContainer(for: ApiSwiftDataVideo.self, ApiSwiftDataMeta.self)

    init() {
        let modelContext = modelContainer.mainContext
        Injection.shared.registerInitialDependencies(modelContext: modelContext)
    }

    @StateObject private var injection = Injection.shared
    @StateObject private var coordinator = MainTabCoordinator(container: Injection.shared.getContainer())

    var body: some Scene {
        WindowGroup {
            coordinator.startView()
                .environmentObject(coordinator)
                .environmentObject(injection)
                .modelContainer(modelContainer)
        }
    }
}
