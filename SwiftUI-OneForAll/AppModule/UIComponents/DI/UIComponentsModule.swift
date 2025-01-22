//
//  UIComponentsModule.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation

final class UIComponentsModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension UIComponentsModule {
    func injectPresentation() {
        container.registrar(UIComponentsCoordinator.self) { resolver in
            UIComponentsCoordinator(container: self.container)
        }

        container.registrarUna(UIComponentsViewModel.self) { (resolver, coordinator: UIComponentsCoordinator) in
            UIComponentsViewModel(coordinator: coordinator)
        }

        container.registrarUna(UIComponentsView.self) { (resolver, coordinator: UIComponentsCoordinator) in
            let viewModel = resolver.obtenerUna(UIComponentsViewModel.self, argument: coordinator)!
            return UIComponentsView(viewModel: viewModel)
        }
    }
}
