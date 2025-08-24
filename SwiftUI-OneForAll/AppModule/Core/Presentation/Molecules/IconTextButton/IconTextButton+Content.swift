//
//  IconTextButton+Content.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//

import SwiftUI

extension IconTextButton {
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                icon
                    .resizable()
                    .foregroundColor(Color.blackColor)
                    .frame(width: width, height: height)

                MyText(
                    text: text,
                    font: Fonts.SwiftUIFont.button1,
                    lines: 1,
                    textColor: Color.blackColor
                )
            }
        }
    }
}
