//
//  FunctionalitiesRoute.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

enum FunctionalitiesRoute: Route {
    case customHeader
    case dataBackward
    case dataBackwardFavorite(BindableBool)
}

struct BindableBool: Hashable {
    var binding: Binding<Bool>

    // Hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(binding.wrappedValue)
    }

    // Equatable
    static func == (lhs: BindableBool, rhs: BindableBool) -> Bool {
        lhs.binding.wrappedValue == rhs.binding.wrappedValue
    }
}
