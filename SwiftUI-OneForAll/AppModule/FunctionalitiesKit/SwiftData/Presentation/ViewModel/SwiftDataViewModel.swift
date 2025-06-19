//
//  SwiftDataViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 17-06-25.
//

import SwiftUI
import SwiftData

final class SwiftDataViewModel: ObservableObject {
    // Init
    @Published var coordinator: FunctionalitiesCoordinator

    init(coordinator: FunctionalitiesCoordinator) {
        self.coordinator = coordinator
    }
    
    let container = try! ModelContainer(for: UiSwiftDataVideo.self, UiSwiftDataMeta.self)
    
    @MainActor
    var modelContext: ModelContext {
        container.mainContext
    }

    @Published var videos: [UiSwiftDataVideo] = []
    
    
    @MainActor
    func getVideos() {
        let fetchDescriptor = FetchDescriptor<UiSwiftDataVideo>(
            predicate: nil,
            sortBy: [SortDescriptor<UiSwiftDataVideo>(\.title)]
        )
        videos = try! modelContext.fetch(fetchDescriptor)
    }

    @MainActor
    func insert(video: UiSwiftDataVideo) {
        modelContext.insert(video)
//        videos = []
        getVideos()
    }

    @MainActor
    func deleteAllVideos() {
        videos.forEach {
            modelContext.delete($0)
        }
//        videos = []
        getVideos()
    }
}
