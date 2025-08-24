//
//  ToastMenuViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 23-08-25.
//

import SwiftUI

final class ToastMenuViewModel: ObservableObject {
    // Init
    @Published var coordinator: UIComponentsCoordinator
    @Published var showToast: Bool = false
    
    init(coordinator: UIComponentsCoordinator) {
        self.coordinator = coordinator
    }

    func updateShowToast(_ value: Bool) {
        showToast = value
    }
}
