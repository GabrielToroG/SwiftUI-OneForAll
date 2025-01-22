//
//  FunctionalitiesModule.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation

final class FunctionalitiesModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension FunctionalitiesModule {
    func injectPresentation() {
        container.registrar(FunctionalitiesCoordinator.self) { resolver in
            FunctionalitiesCoordinator(container: self.container)
        }

        container.registrarUna(FunctionalitiesViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            FunctionalitiesViewModel(coordinator: coordinator)
        }

        container.registrarUna(FunctionalitiesView.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            let viewModel = resolver.obtenerUna(FunctionalitiesViewModel.self, argument: coordinator)!
            return FunctionalitiesView(viewModel: viewModel)
        }
    }
}
