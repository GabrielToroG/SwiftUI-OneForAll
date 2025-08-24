//
//  CustomVStack.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 22-05-25.
//

import SwiftUI

/// Spacing 16 & Padding 16
struct CustomVStack<Content: View>: View {
    let alignment: HorizontalAlignment
    let spacing: CGFloat?
    let padding: EdgeInsets
    let content: () -> Content

    init(
        alignment: HorizontalAlignment = .center,
        spacing: CGFloat? = Dimensions.Stacks.normal,
        padding: EdgeInsets = EdgeInsets(
            top: Dimensions.Margin.tiny,
            leading: Dimensions.Margin.normal,
            bottom: Dimensions.Margin.normal,
            trailing: Dimensions.Margin.normal
        ),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.padding = padding
        self.content = content
    }
}
