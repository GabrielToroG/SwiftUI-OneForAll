//
//  AddVideoUseCase.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

class AddVideoUseCase {
    private let repository: SwiftDataRepository
    init(repository: SwiftDataRepository) {
        self.repository = repository
    }
    func execute(video: DomainSwiftDataVideo) async throws {
        try await repository.insert(video: video)
    }
}
