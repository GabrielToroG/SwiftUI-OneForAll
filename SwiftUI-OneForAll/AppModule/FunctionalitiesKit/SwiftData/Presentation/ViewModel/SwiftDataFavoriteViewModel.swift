//
//  SwiftDataFavoriteViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 18-06-25.
//

import SwiftUI

final class SwiftDataFavoriteViewModel: ObservableObject {
    // Init
    @Published var coordinator: FunctionalitiesCoordinator
    private var toggleFavoriteUseCase: ToggleFavoriteUseCase
    @Published var video: UiSwiftDataVideo
    
    init(
        coordinator: FunctionalitiesCoordinator,
        video: UiSwiftDataVideo,
        toggleFavorite: ToggleFavoriteUseCase
    ) {
        self.coordinator = coordinator
        self.video = video
        self.toggleFavoriteUseCase = toggleFavorite
    }

    @MainActor
    func toggleFavorite() async {
        try? await toggleFavoriteUseCase.execute(id: video.id)
    }
}
