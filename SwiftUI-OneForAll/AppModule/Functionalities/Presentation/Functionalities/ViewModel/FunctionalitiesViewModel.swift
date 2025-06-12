//
//  FunctionalitiesViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation

final class FunctionalitiesViewModel: ObservableObject {
    // Properties
    let options: [UIFunctionalitiesOption] = [
        UIFunctionalitiesOption(icon: "functionalities.button.header", title: "Header Custom"),
        UIFunctionalitiesOption(icon: "functionalities.button.backward", title: "Compartir data hacia atrás")
    ]

    // Init
    @Published var coordinator: FunctionalitiesCoordinator

    init(coordinator: FunctionalitiesCoordinator) {
        self.coordinator = coordinator
    }
}
