//
//  DataBackwardViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 26-01-25.
//

import SwiftUI

final class DataBackwardViewModel: ObservableObject {
    @Published var coordinator: FunctionalitiesCoordinator
    @Published var isFavorite: Bool = false

    init(coordinator: FunctionalitiesCoordinator) {
        self.coordinator = coordinator
    }
}
