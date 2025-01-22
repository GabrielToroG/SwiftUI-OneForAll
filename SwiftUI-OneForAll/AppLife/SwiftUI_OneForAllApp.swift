//
//  SwiftUI_OneForAllApp.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

@main
struct SwiftUI_OneForAllApp: App {

    @StateObject private var injection = Injection.shared
    @StateObject private var coordinator = MainTabCoordinator(container: Injection.shared.getContainer())

    var body: some Scene {
        WindowGroup {
            coordinator.startView()
                .environmentObject(coordinator)
                .environmentObject(injection)
        }
    }
}
