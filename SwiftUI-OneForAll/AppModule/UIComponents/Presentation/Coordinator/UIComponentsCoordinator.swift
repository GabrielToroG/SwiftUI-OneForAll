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

    func navigateToImage() {
        path.append(UIComponentsRoute.image)
    }

    func navigateToButton() {
        path.append(UIComponentsRoute.button)
    }
}

extension UIComponentsCoordinator: Coordinator {
    @ViewBuilder
    func redirect(_ path: UIComponentsRoute) -> some View {
        switch path {
        case .label:
            container.obtenerUna(LabelView.self, argument: self)
        case .image:
            container.obtenerUna(ImageView.self, argument: self)
        case .button:
            container.obtenerUna(ButtonView.self, argument: self)
        }
    }
}
