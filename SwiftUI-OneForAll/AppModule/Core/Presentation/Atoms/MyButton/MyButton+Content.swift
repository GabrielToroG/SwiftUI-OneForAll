//
//  MyButton+Content.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//

import SwiftUI

extension MyButton {
    var body: some View {
        Button { action() } label: {
            MyText(
                text: text,
                font: Fonts.SwiftUIFont.button1,
                lines: 1,
                textColor: Color.blackColor
            )
        }
        .frame(maxWidth: .infinity)
        .frame(height: Dimensions.Button.Height.normal)
        .background(backgroundColor)
        .cornerRadius(Dimensions.BorderRadius.medium)
        .overlay(borderOverlay)
        .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowY)
    }
}

extension MyButton {
    private var backgroundColor: Color {
        switch style {
        case .bordered:
            return .clear
        case .filled, .filledShadow:
            return .brownColor
        }
    }

    private var borderOverlay: some View {
        RoundedRectangle(cornerRadius: Dimensions.BorderRadius.medium)
            .stroke(
                Color.blackColor,
                lineWidth: style == .bordered ? 1 : 0
            )
    }

    private var shadowColor: Color {
        style == .filledShadow ? Color.blackColor.opacity(0.2) : .clear
    }

    private var shadowRadius: CGFloat {
        style == .filledShadow ? 1 : 0
    }

    private var shadowY: CGFloat {
        style == .filledShadow ? 4 : 0
    }
}
