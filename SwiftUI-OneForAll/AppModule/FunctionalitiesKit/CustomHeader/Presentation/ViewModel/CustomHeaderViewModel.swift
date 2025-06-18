//
//  CustomHeaderViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-05-25.
//

import Foundation

final class CustomHeaderViewModel: ObservableObject {
    // Init
    @Published var coordinator: FunctionalitiesCoordinator

    init(coordinator: FunctionalitiesCoordinator) {
        self.coordinator = coordinator
    }
}
