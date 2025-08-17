//
//  SwiftDataRepositoryImpl.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

import Foundation

final class SwiftDataRepositoryImpl: SwiftDataRepository {
    private let local: SwiftDataLocalDataSource
    private let mapper: SwiftDataDataMapper

    init(
        local: SwiftDataLocalDataSource,
        mapper: SwiftDataDataMapper
    ) {
        self.local = local
        self.mapper = mapper
    }

    func fetchVideos() async throws -> [DomainSwiftDataVideo] {
        let dataModels = try await local.fetchVideos()
        return mapper.dataToDomain(dataModels)
    }

    func insert(video: DomainSwiftDataVideo) async throws {
        let dataModel = mapper.domainToData(video)
        try await local.insert(video: dataModel)
    }

    func deleteAll() async throws {
        try await local.deleteAll()
    }

    func toggleFavorite(id: UUID) async throws {
        try await local.toggleFavorite(id: id)
    }
}
