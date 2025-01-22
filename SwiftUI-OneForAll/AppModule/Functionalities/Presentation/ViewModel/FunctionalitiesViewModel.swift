//
//  FunctionalitiesViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation

final class FunctionalitiesViewModel: ObservableObject {
    @Published var coordinator: FunctionalitiesCoordinator
    
    init(coordinator: FunctionalitiesCoordinator) {
        self.coordinator = coordinator
    }
}
