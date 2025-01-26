//
//  TextExtension.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 25-01-25.
//

import SwiftUI

public extension Collection where Element == Text {
    func concat() -> Text {
        // Reducimos la colección de Text para concatenarlos en un único Text
        self.reduce(Text("")) { result, text in
            result + text + Text(" ")
        }
    }
}
