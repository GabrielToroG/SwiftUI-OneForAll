//
//  ToolbarLeadingModifier.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-01-25.
//

import SwiftUI

struct ToolbarLeadingModifier<Items: View>: ViewModifier {
    let items: () -> Items

    init(@ViewBuilder items: @escaping () -> Items) {
        self.items = items
    }

    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            toolbarLeading(content: content)
        } else {
            toolbarLeadingSupport(content: content)
        }
    }

    @available(iOS 14.0, *)
    private func toolbarLeading(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    items()
                }
            }
    }

    @available(iOS, deprecated: 14.0)
    private func toolbarLeadingSupport(content: Content) -> some View {
        content
            .navigationBarItems(leading: items())
    }
}
