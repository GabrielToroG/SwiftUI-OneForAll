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

struct UiSwiftDataVideo: Identifiable, Equatable, Hashable {
    let id: UUID
    var title: String
    var isFavorite: Bool
    let numberOfLikes: Int
}
