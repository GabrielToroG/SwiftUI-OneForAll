//
//  MainTabCoordinator.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

class MainTabCoordinator: ObservableObject {
    @Published var path: [MainTabRoute] = []

    private let container: Container

    init(container: Container) {
        self.container = container
    }

    func startView() -> some View {
        let controllerProvider = container.obtener(MainControllerProvider.self)!
        let mainTabView = controllerProvider.getMainTab()
        return AnyView(mainTabView.environmentObject(self))
    }
}


enum MainTabRoute: Route {
    case none
}
