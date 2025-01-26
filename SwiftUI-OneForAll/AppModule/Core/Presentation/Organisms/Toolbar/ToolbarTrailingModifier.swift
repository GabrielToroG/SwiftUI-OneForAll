//
//  ToolbarTrailingModifier.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-01-25.
//

import SwiftUI

struct ToolbarTrailingModifier<Items: View>: ViewModifier {
    let items: () -> Items

    init(@ViewBuilder items: @escaping () -> Items) {
        self.items = items
    }

    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            toolbarTrailing(content: content)
        } else {
            toolbarTrailingSupport(content: content)
        }
    }

    @available(iOS 14.0, *)
    private func toolbarTrailing(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    items()
                }
            }
    }

    @available(iOS, deprecated: 14.0)
    private func toolbarTrailingSupport(content: Content) -> some View {
        content
            .navigationBarItems(trailing: items())
    }
}
