//
//  MyConcatText+Content.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//

import SwiftUI

extension MyConcatText {
    var body: some View {
        style.map { styledText in
            Text(styledText.text)
                .font(styledText.font)
                .foregroundColor(styledText.textColor)
        }
        .concat()
    }
}
