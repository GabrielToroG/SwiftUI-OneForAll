//
//  MyConcatText+Content.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 23-03-25.
//

import SwiftUI

struct MyConcatTextStyle {
    let text: String
    let font: Font
    let textColor: Color

    init(
        text: String = "",
        font: Font = Fonts.SwiftUIFont.body1,
        textColor: Color = Color.blackColor
    ) {
        self.text = text
        self.font = font
        self.textColor = textColor
    }
}

