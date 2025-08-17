//
//  ApiSwiftDataVideo.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

import Foundation
import SwiftData

@Model
class ApiSwiftDataVideo {
    @Attribute(.unique) var id: UUID
    var title: String
    @Relationship(deleteRule: .cascade) var metadata: ApiSwiftDataMeta

    init(id: UUID = .init(), title: String, metadata: ApiSwiftDataMeta) {
        self.id = id
        self.title = title
        self.metadata = metadata
    }
}
