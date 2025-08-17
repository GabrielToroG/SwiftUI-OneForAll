//
//  GetAllVideosUseCase.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 16-07-25.
//

class GetAllVideosUseCase {
    private let repository: SwiftDataRepository

    init(repository: SwiftDataRepository) {
        self.repository = repository
    }

    func execute() async throws -> [DomainSwiftDataVideo] {
        try await repository.fetchVideos()
    }
}
