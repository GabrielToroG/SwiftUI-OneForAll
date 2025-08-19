//
//  CustomHeaderModule.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 27-07-25.
//

final class CustomHeaderModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.registrarUna(CustomHeaderViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            CustomHeaderViewModel(coordinator: coordinator)
        }

        container.registrarUna(CustomHeaderView.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            let viewModel = resolver.obtenerUna(CustomHeaderViewModel.self, argument: coordinator)
            return CustomHeaderView(viewModel: viewModel)
        }
    }
}
