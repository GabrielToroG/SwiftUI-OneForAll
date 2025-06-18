//
//  SwiftDataViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 17-06-25.
//

import SwiftUI

final class SwiftDataViewModel: ObservableObject {
    // Init
    @Published var coordinator: FunctionalitiesCoordinator

    init(coordinator: FunctionalitiesCoordinator) {
        self.coordinator = coordinator
    }
}
