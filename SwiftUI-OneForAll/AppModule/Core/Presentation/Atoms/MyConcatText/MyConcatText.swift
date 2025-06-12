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
    }
}
