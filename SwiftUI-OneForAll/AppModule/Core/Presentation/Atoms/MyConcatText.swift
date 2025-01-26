//
//  MyConcatText.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 25-01-25.
//

import SwiftUI

struct MyConcatText: View {
    let style: [MyConcatTextStyle]

    init(style: [MyConcatTextStyle]) {
        self.style = style
    }

    var body: some View {
        style.map { styledText in
            Text(styledText.text)
                .font(styledText.font)
                .foregroundColor(styledText.textColor)
        }
        .concat()
        
//        Text(style.text)
//            .font(style.font)
//            .foregroundColor(style.textColor)
    }
}

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
