//
//  UiSwiftDataVideo.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 18-06-25.
//

import Foundation
import SwiftData

/*
    - @Attribute: Modificador de atributos
    - @Transient: Cuando no quieres almacenar un valor en la bd
    - @Relationship: Establece relación entre 2 entidades de la bd
*/

@Model // Esta entidad estará en nuestra bd
class UiSwiftDataVideo {
    @Attribute(.unique) var id: UUID
    var title: String
    @Transient var numberOfLikes: Int { title.count }
    @Relationship(deleteRule: .cascade) var metadata: UiSwiftDataMeta

    init(
        id: UUID,
        title: String,
        metadata: UiSwiftDataMeta
    ) {
        self.id = id
        self.title = title
        self.metadata = metadata
    }
}
