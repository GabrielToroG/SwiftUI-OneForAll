//
//  MainControllerProvider.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

final class MainControllerProvider {
    private let container: Container

    init(_ container: Container) {
        self.container = container
    }

    func inject(mainTabCoordinator: MainTabCoordinator?) {
        container.registrar(MainTabCoordinator?.self) { _ in
            mainTabCoordinator
        }
    }

    func getMainTab() -> some View {
        let mainTabView = container.obtener(MainTabView.self)!
        return mainTabView
    }

    func getUIComponentsTab() -> some View {
        let coordinator = container.obtener(UIComponentsCoordinator.self)!
        let view = container.obtenerUna(UIComponentsView.self, argument: coordinator)
        return view
    }

    func getFunctionalitiesTab() -> some View {
        let coordinator = container.obtener(FunctionalitiesCoordinator.self)!
        let view = container.obtenerUna(FunctionalitiesView.self, argument: coordinator)
        return view
    }
}
