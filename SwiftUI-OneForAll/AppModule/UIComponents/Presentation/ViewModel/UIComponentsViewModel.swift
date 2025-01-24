//
//  UIComponentsViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

final class UIComponentsViewModel: ObservableObject {
    let options: [UIComponentOption] = [
        UIComponentOption(icon: "home.label.option", title: "Label"),
        UIComponentOption(icon: "home.image.option", title: "Image"),
        UIComponentOption(icon: "home.button.option", title: "Buttons"),
        UIComponentOption(icon: "home.textfield.option", title: "Text Fields"),
    ]

    @Published var coordinator: UIComponentsCoordinator

    init(coordinator: UIComponentsCoordinator) {
        self.coordinator = coordinator
    }
}
