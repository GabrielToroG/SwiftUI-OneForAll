//
//  FunctionalitiesCoordinator.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

final class FunctionalitiesCoordinator: ObservableObject {
    @Published var path: [FunctionalitiesRoute] = []

    private let container: Container
    init(container: Container) {
        self.container = container
    }

    func goBack() {
        path.removeLast()
    }

    func navigateToDataBackward() {
        path.append(FunctionalitiesRoute.dataBackward)
    }

    func navigateToDataBackwardFavorite(isFavorite: Binding<Bool>) {
        let bindableBool = BindableBool(binding: isFavorite)
        path.append(FunctionalitiesRoute.dataBackwardFavorite(bindableBool))
    }
}

extension FunctionalitiesCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: FunctionalitiesRoute) -> some View {
        switch path {
        case .dataBackward:
            container.obtenerUna(DataBackwardView.self, argument: self)
        case .dataBackwardFavorite(let bindableBool):
            container.obtenerDos(FavoriteView.self, argument1: self, argument2: bindableBool)
        }
    }
}
