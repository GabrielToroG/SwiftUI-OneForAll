//
//  FontsExtension.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 25-01-25.
//

import SwiftUI

extension Fonts {
    static func font(for uiFont: UIFont) -> Font {
        return Font(uiFont)
    }
}

extension Fonts {
    enum SwiftUIFont {
        // Heading fonts
        static let heading1 = font(for: Heading.heading1)
        static let heading2 = font(for: Heading.heading2)
        static let heading3 = font(for: Heading.heading3)
        static let heading4 = font(for: Heading.heading4)
        
        // Body fonts
        static let body1 = font(for: Body.body1)
        static let body2 = font(for: Body.body2)
        static let body3 = font(for: Body.body3)
        static let body4 = font(for: Body.body4)
        static let body1SemiBold = font(for: Body.body1SemiBold)
        
        // Button fonts
        static let button1 = font(for: Button.button1)
        
        // TextField fonts
        static let textfield1 = font(for: TextField.textfield1)
    }
}
