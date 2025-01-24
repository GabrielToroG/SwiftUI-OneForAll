//
//  ViewExtension.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

extension View {
    func applyNavigation<CoordinatorType: Coordinator>(coordinator: CoordinatorType) -> some View {
        self.modifier(NavigationSetupModifier(coordinator: coordinator))
    }

    func setupNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.blackColor,
            .font: Fonts.Heading.heading2
        ]
        appearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.blackColor,
            .font: Fonts.Heading.heading1
        ]
        appearance.backgroundColor = .clear
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
