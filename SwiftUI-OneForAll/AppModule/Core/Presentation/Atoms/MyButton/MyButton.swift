//
//  MyButton.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 23-03-25.
//

import SwiftUI

struct MyButton: View {

    let text: String
    let style: MyButtonStyle
    let action: () -> Void

    var body: some View {
        switch style {
        case .filled:
            Button {
                action()
            } label: {
                MyText(
                    text: text,
                    font: Fonts.SwiftUIFont.button1,
                    lines: 1,
                    textColor: Color.blackColor
                )
            }
            .frame(maxWidth: .infinity)
            .frame(height: Dimensions.Button.Height.normal)
            .background(Color.brownColor)
            .cornerRadius(Dimensions.BorderRadius.medium)
        case .filledShadow:
            Button {
                action()
            } label: {
                MyText(
                    text: text,
                    font: Fonts.SwiftUIFont.button1,
                    lines: 1,
                    textColor: Color.blackColor
                )
            }
            .frame(maxWidth: .infinity)
            .frame(height: Dimensions.Button.Height.normal)
            .background(Color.brownColor)
            .cornerRadius(Dimensions.BorderRadius.medium)
            .shadow(color: Color.blackColor.opacity(0.2), radius: 1, x: .zero, y: 4)
        }
    }
}


enum MyButtonStyle {
    case filled
    case filledShadow
//    case bordered
}
