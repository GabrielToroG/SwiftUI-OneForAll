//
//  ViewExtension.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

// MARK: - General
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
        appearance.shadowColor = .clear // delete border bottom
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    /// Función para agregar el header izquierdo
    func toolbarLeading<Items: View>(@ViewBuilder items: @escaping () -> Items) -> some View {
        modifier(ToolbarLeadingModifier(items: items))
            .navigationBarBackButtonHidden(true) // Oculta la flecha atrás nativo
    }
    /// Función para agregar el header derecho
    func toolbarTrailing<Items: View>(@ViewBuilder items: @escaping () -> Items) -> some View {
        modifier(ToolbarTrailingModifier(items: items))
    }
}

// MARK: - Custom Views
extension View {
    /// Función para llamar al toast, ya sea por la parte superior o infeior. También se le puede fijar el comportamiento para desaparecer
    func toast(
        isPresented: Binding<Bool>,
        style: ToastStyle,
        message: String,
        position: ToastPosition = .bottom,
        behavior: ToastBehavior = .autoAndTap
    ) -> some View {
        self.modifier(ToastModifier(
            isPresented: isPresented,
            style: style,
            message: message,
            position: position,
            behavior: behavior
        ))
    }
}
