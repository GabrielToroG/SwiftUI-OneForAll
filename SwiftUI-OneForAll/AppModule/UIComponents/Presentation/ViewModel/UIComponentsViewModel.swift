//
//  UIComponentsViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

final class UIComponentsViewModel: ObservableObject {
    @Published var coordinator: UIComponentsCoordinator

    init(coordinator: UIComponentsCoordinator) {
        self.coordinator = coordinator
    }
}
