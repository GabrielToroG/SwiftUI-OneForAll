//
//  SwiftDataRepository.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

import Foundation

protocol SwiftDataRepository {
    func fetchVideos() async throws -> [DomainSwiftDataVideo]
    func insert(video: DomainSwiftDataVideo) async throws
    func deleteAll() async throws
    func toggleFavorite(id: UUID) async throws
}
