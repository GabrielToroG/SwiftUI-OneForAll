//
//  ButtonIcon.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 23-03-25.
//

import SwiftUI

struct IconButton: View {
    let icon: Image
    let width: CGFloat
    let height: CGFloat
    let action: () -> Void

    init(
        icon: Image,
        width: CGFloat = Dimensions.Icon.smallSize,
        height: CGFloat = Dimensions.Icon.smallSize,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.width = width
        self.height = height
        self.action = action
    }
}
