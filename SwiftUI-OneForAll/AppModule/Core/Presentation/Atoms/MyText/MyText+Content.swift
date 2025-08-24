//
//  MyText+Content.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//

import SwiftUI

extension MyText {
    var body: some View {
        Text(text)
            .font(font)
            .lineLimit(lines)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .strikethrough(useStrikethrough)
    }
}
