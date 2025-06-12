//
//  ButtonViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 23-03-25.
//

import Foundation

final class ButtonViewModel: ObservableObject {
    @Published var coordinator: UIComponentsCoordinator

    init(coordinator: UIComponentsCoordinator) {
        self.coordinator = coordinator
    }
}
