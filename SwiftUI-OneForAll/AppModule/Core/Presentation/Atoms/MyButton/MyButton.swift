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

    init(
        text: String,
        style: MyButtonStyle,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.style = style
        self.action = action
    }
}
