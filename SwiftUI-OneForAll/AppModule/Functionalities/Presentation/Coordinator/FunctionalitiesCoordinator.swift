//
//  FunctionalitiesCoordinator.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

final class FunctionalitiesCoordinator: ObservableObject {
    @Published var path: [UIComponentsRoute] = []

    private let container: Container
    init(container: Container) {
        self.container = container
    }

    func goBack() {
        path.removeLast()
    }
    
    func navigateToFirst() {
        path.append(UIComponentsRoute.label)
    }
}

extension FunctionalitiesCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: UIComponentsRoute) -> some View {
        switch path {
        case .label:
            let viewModel = FunctionalitiesViewModel(coordinator: self)
            FunctionalitiesView(viewModel: viewModel)
        }
    }
}

