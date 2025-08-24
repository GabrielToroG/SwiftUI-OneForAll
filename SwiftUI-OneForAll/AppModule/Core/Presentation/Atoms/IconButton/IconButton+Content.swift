//
//  IconButton+Content.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//

import SwiftUI

extension IconButton {
    var body: some View {
        Button {
            action()
        } label: {
            icon
                .resizable()
                .foregroundColor(Color.blackColor)
                .frame(width: width, height: height)
        }
    }
}
