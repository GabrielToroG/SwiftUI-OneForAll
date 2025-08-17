//
//  ToggleFavoriteUseCase.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 26-07-25.
//

// Domain/UseCase/ToggleFavoriteUseCase.swift
import Foundation

struct ToggleFavoriteUseCase {
    private let repository: SwiftDataRepository

    init(repository: SwiftDataRepository) {
        self.repository = repository
    }

    func execute(id: UUID) async throws {
        try await repository.toggleFavorite(id: id)
    }
}
