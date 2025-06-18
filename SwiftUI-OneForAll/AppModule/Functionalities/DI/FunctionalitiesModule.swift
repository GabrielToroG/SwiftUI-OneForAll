//
//  FunctionalitiesModule.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

final class FunctionalitiesModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectFunctionalitiesModule()
        injectCustomHeaderModule()
        injectDataBackwardModule()
    }
}

private extension FunctionalitiesModule {
    func injectFunctionalitiesModule() {
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

private extension FunctionalitiesModule {
    func injectCustomHeaderModule() {
        container.registrarUna(CustomHeaderViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            CustomHeaderViewModel(coordinator: coordinator)
        }
        
        container.registrarUna(CustomHeaderView.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            let viewModel = resolver.obtenerUna(CustomHeaderViewModel.self, argument: coordinator)!
            return CustomHeaderView(viewModel: viewModel)
        }
    }
}

private extension FunctionalitiesModule {
    func injectDataBackwardModule() {
        container.registrarUna(DataBackwardViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            DataBackwardViewModel(coordinator: coordinator)
        }

        container.registrarUna(DataBackwardView.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            let viewModel = resolver.obtenerUna(DataBackwardViewModel.self, argument: coordinator)!
            return DataBackwardView(viewModel: viewModel)
        }

        container.registrarDos(FavoriteViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator, isFavorite: BindableBool) in
            FavoriteViewModel(coordinator: coordinator, isFavorite: isFavorite)
        }

        container.registrarDos(FavoriteView.self) { (resolver, coordinator: FunctionalitiesCoordinator, isFavorite: BindableBool) in
            let viewModel = resolver.obtenerDos(FavoriteViewModel.self, argument1: coordinator, argument2: isFavorite)!
            return FavoriteView(viewModel: viewModel)
        }
    }
}

private extension FunctionalitiesModule {
    func injectSwiftDataModule() {
        container.registrarUna(SwiftDataViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            SwiftDataViewModel(coordinator: coordinator)
        }
        
        container.registrarUna(SwiftDataView.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            let viewModel = resolver.obtenerUna(SwiftDataViewModel.self, argument: coordinator)!
            return SwiftDataView(viewModel: viewModel)
        }
    }
}
