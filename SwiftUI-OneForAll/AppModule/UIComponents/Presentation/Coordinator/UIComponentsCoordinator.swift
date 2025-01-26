//
//  UIComponentsCoordinator.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

final class UIComponentsCoordinator: ObservableObject {
    @Published var path: [UIComponentsRoute] = []

    private let container: Container
    init(container: Container) {
        self.container = container
    }

    func goBack() {
        path.removeLast()
    }
    
    func navigateToLabel() {
        path.append(UIComponentsRoute.label)
    }
}

extension UIComponentsCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: UIComponentsRoute) -> some View {
        switch path {
        case .label:
            let viewModel = LabelViewModel(coordinator: self)
            LabelView(viewModel: viewModel)
        }
    }
}
