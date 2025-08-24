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
            let viewModel = resolver.obtenerUna(UIComponentsViewModel.self, argument: coordinator)
            return UIComponentsView(viewModel: viewModel)
        }

        // MARK: - Label
        container.registrarUna(LabelViewModel.self) { (resolver, coordinator: UIComponentsCoordinator) in
            LabelViewModel(coordinator: coordinator)
        }

        container.registrarUna(LabelView.self) { (resolver, coordinator: UIComponentsCoordinator) in
            let viewModel = resolver.obtenerUna(LabelViewModel.self, argument: coordinator)
            return LabelView(viewModel: viewModel)
        }

        // MARK: - Image
        container.registrarUna(ImageViewModel.self) { (resolver, coordinator: UIComponentsCoordinator) in
            ImageViewModel(coordinator: coordinator)
        }

        container.registrarUna(ImageView.self) { (resolver, coordinator: UIComponentsCoordinator) in
            let viewModel = resolver.obtenerUna(ImageViewModel.self, argument: coordinator)
            return ImageView(viewModel: viewModel)
        }

        // MARK: - Button
        container.registrarUna(ButtonViewModel.self) { (resolver, coordinator: UIComponentsCoordinator) in
            ButtonViewModel(coordinator: coordinator)
        }

        container.registrarUna(ButtonView.self) { (resolver, coordinator: UIComponentsCoordinator) in
            let viewModel = resolver.obtenerUna(ButtonViewModel.self, argument: coordinator)
            return ButtonView(viewModel: viewModel)
        }

        // MARK: - Toast
        container.registrarUna(ToastMenuViewModel.self) { (resolver, coordinator: UIComponentsCoordinator) in
            ToastMenuViewModel(coordinator: coordinator)
        }

        container.registrarUna(ToastMenuView.self) { (resolver, coordinator: UIComponentsCoordinator) in
            let viewModel = resolver.obtenerUna(ToastMenuViewModel.self, argument: coordinator)
            return ToastMenuView(viewModel: viewModel)
        }
    }
}
