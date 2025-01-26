//
//  MyText.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 25-01-25.
//

import SwiftUI

struct MyText: View {
    let text: String
    let font: Font
    let lines: Int
    let textColor: Color
    let backgroundColor: Color
    let useStrikethrough: Bool

    init(
        text: String = "",
        font: Font = Fonts.SwiftUIFont.body1,
        lines: Int = .zero,
        textColor: Color = Color.blackColor,
        backgroundColor: Color = Color.clear,
        useStrikethrough: Bool = false
    ) {
        self.text = text
        self.font = font
        self.lines = lines
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.useStrikethrough = useStrikethrough
    }

    var body: some View {
        Text(text)
            .font(font)
            .lineLimit(lines)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .strikethrough(useStrikethrough)
    }
}


