//
//  SwiftDataLocalDataSourceImpl.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

import SwiftData
import Foundation

final class SwiftDataLocalDataSourceImpl: SwiftDataLocalDataSource {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func fetchVideos() async throws -> [ApiSwiftDataVideo] {
        let descriptor = FetchDescriptor<ApiSwiftDataVideo>(sortBy: [SortDescriptor(\ApiSwiftDataVideo.title)])
        return try modelContext.fetch(descriptor)
    }

    func insert(video: ApiSwiftDataVideo) async throws {
        modelContext.insert(video)
        try modelContext.save()
    }

    func deleteAll() async throws {
        let all = try await fetchVideos()
        all.forEach { modelContext.delete($0) }
        try modelContext.save()
    }

    func toggleFavorite(id: UUID) async throws {
        let descriptor = FetchDescriptor<ApiSwiftDataVideo>(predicate: #Predicate { $0.id == id })
        if let video = try modelContext.fetch(descriptor).first {
            video.metadata.isFavorite.toggle()
            try modelContext.save()
        }
    }
}
