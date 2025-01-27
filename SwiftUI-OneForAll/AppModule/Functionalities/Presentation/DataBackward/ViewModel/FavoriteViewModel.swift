//
//  FavoriteViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 26-01-25.
//

import SwiftUI

final class FavoriteViewModel: ObservableObject {
    @Published var coordinator: FunctionalitiesCoordinator
    @Published var isFavoriteState: Bool
    @Binding var isFavorite: Bool

    init(coordinator: FunctionalitiesCoordinator, isFavorite: BindableBool) {
        self.coordinator = coordinator
        self._isFavorite = isFavorite.binding
        self.isFavoriteState = isFavorite.binding.wrappedValue
    }

    func toggleFavorite() {
        isFavorite.toggle()
        isFavoriteState.toggle()
    }
}
