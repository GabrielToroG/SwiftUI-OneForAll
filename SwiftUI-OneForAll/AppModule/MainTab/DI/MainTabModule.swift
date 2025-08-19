//
//  MainTabModule.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation

final class MainTabModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        injectPresentation()
    }
}

private extension MainTabModule {
    func injectPresentation() {
        container.registrarUna(MainTabView.self) { container, provider in
            MainTabView(controllerProvider: provider)
        }
    }
}
