//
//  CustomVStack+Content.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//

import SwiftUI

extension CustomVStack {
    var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            content()
        }
        .padding(padding)
    }
}
