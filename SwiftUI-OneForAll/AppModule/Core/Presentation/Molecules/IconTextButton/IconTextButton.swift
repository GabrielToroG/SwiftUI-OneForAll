//
//  IconTextButton.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 12-06-25.
//

import SwiftUI

struct IconTextButton: View {
    let icon: Image
    let width: CGFloat
    let height: CGFloat
    let text: String
    let action: () -> Void

    init(
        icon: Image,
        width: CGFloat = Dimensions.Icon.smallSize,
        height: CGFloat = Dimensions.Icon.smallSize,
        text: String,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.width = width
        self.height = height
        self.action = action
        self.text = text
    }

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
