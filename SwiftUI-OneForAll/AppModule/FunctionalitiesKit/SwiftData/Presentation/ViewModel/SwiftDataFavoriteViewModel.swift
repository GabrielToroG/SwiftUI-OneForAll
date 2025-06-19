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
//    @Published var videoState: UiSwiftDataVideo
//    @Binding var video: UiSwiftDataVideo
    var video: UiSwiftDataVideo
    
    init(coordinator: FunctionalitiesCoordinator, video: UiSwiftDataVideo) {
        self.coordinator = coordinator
        self.video = video
//        self._video = video.binding
//        self.videoState = video.binding.wrappedValue
    }
}
