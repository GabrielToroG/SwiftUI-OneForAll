//
//  SwiftDataLocalDataSource.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

import Foundation

protocol SwiftDataLocalDataSource {
    func fetchVideos() async throws -> [ApiSwiftDataVideo]
    func insert(video: ApiSwiftDataVideo) async throws
    func deleteAll() async throws
    func toggleFavorite(id: UUID) async throws
}
