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

    func goToCustomHeader() {
        path.append(FunctionalitiesRoute.customHeader)
    }

    func goToDataBackward() {
        path.append(FunctionalitiesRoute.dataBackward)
    }

    func goToDataBackwardFavorite(isFavorite: Binding<Bool>) {
        let bindableBool = BindableBool(binding: isFavorite)
        path.append(FunctionalitiesRoute.dataBackwardFavorite(bindableBool))
    }

    func goToSwiftData() {
        path.append(FunctionalitiesRoute.swiftData)
    }
}

extension FunctionalitiesCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: FunctionalitiesRoute) -> some View {
        switch path {
        case .customHeader:
            container.obtenerUna(CustomHeaderView.self, argument: self)
        case .dataBackward:
            container.obtenerUna(DataBackwardView.self, argument: self)
        case .dataBackwardFavorite(let bindableBool):
            container.obtenerDos(FavoriteView.self, argument1: self, argument2: bindableBool)
        case .swiftData:
            container.obtenerUna(SwiftDataView.self, argument: self)
        }
    }
}
