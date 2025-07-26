//
//  Data.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

import Foundation
import SwiftData

@Model
class DataSwiftDataVideo {
    @Attribute(.unique) var id: UUID
    var title: String
    @Relationship(deleteRule: .cascade) var metadata: DataSwiftDataMeta

    init(id: UUID = .init(), title: String, metadata: DataSwiftDataMeta) {
        self.id = id
        self.title = title
        self.metadata = metadata
    }
}
