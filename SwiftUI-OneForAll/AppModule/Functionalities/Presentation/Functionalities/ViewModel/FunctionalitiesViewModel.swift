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
        UIFunctionalitiesOption(icon: "functional.header.option", title: "Header Custom"),
        UIFunctionalitiesOption(icon: "functional.backward.option", title: "Compartir data hacia atrás"),
        UIFunctionalitiesOption(icon: "functional.swiftdata.option", title: "SwiftData")
    ]

    // Init
    @Published var coordinator: FunctionalitiesCoordinator

    init(coordinator: FunctionalitiesCoordinator) {
        self.coordinator = coordinator
    }
}
