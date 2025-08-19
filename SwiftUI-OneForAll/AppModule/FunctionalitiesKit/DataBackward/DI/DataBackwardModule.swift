//
//  DataBackwardModule.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 27-07-25.
//

final class DataBackwardModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.registrarUna(DataBackwardViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            DataBackwardViewModel(coordinator: coordinator)
        }

        container.registrarUna(DataBackwardView.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            let viewModel = resolver.obtenerUna(DataBackwardViewModel.self, argument: coordinator)
            return DataBackwardView(viewModel: viewModel)
        }

        container.registrarDos(FavoriteViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator, isFavorite: BindableBool) in
            FavoriteViewModel(coordinator: coordinator, isFavorite: isFavorite)
        }

        container.registrarDos(FavoriteView.self) { (resolver, coordinator: FunctionalitiesCoordinator, isFavorite: BindableBool) in
            let viewModel = resolver.obtenerDos(FavoriteViewModel.self, argument1: coordinator, argument2: isFavorite)
            return FavoriteView(viewModel: viewModel)
        }
    }
}
