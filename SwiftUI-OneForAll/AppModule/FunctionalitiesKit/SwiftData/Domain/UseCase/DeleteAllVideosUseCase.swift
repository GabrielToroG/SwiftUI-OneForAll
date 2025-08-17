//
//  DeleteAllVideosUseCase.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

class DeleteAllVideosUseCase {
    private let repository: SwiftDataRepository
    init(repository: SwiftDataRepository) {
        self.repository = repository
    }

    func execute() async throws {
        try await repository.deleteAll()
    }
}
