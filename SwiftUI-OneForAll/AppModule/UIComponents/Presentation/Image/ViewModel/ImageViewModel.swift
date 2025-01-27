//
//  ImageViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 25-01-25.
//

import Foundation

final class ImageViewModel: ObservableObject {
    @Published var coordinator: UIComponentsCoordinator

    init(coordinator: UIComponentsCoordinator) {
        self.coordinator = coordinator
    }
}
