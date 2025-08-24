//
//  GradientHeader.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//
import SwiftUI

struct GradientHeader: View {
    let gradient: LinearGradient
    let leadingAction: () -> ()
    let trailingAction: () -> ()
    
    init(
        gradient: LinearGradient = LinearGradient(
            colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.4)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        leadingAction: @escaping () -> Void,
        trailingAction: @escaping () -> Void
    ) {
        self.gradient = gradient
        self.leadingAction = leadingAction
        self.trailingAction = trailingAction
    }
}
