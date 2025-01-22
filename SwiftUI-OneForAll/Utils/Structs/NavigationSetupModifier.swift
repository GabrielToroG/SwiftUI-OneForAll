//
//  NavigationSetupModifier.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

struct NavigationSetupModifier<CoordinatorType: Coordinator>: ViewModifier {
    @ObservedObject var coordinator: CoordinatorType

    func body(content: Content) -> some View {
        NavigationStack(path: $coordinator.path) {
            content
                .navigationDestination(for: CoordinatorType.CoordinatorSteps.self) { step in
                    debugPrint("navigate to: \(CoordinatorType.CoordinatorSteps.self).\(step)")
                    return coordinator.redirect(step)
                }
        }
    }
}
