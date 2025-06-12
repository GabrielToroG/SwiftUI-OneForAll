//
//  SafeAreaCustomVStack.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 22-05-25.
//

import SwiftUI

struct GradientHeader: View {
    let gradient: LinearGradient
    let leadingAction: () -> ()
    let trailingAction: () -> ()
    
    init(
        gradient: LinearGradient = LinearGradient(
            colors: [Color.blue.opacity(0.4), Color.purple.opacity(0.4)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        ),
        leadingAction: @escaping () -> Void,
        trailingAction: @escaping () -> Void
    ) {
        self.gradient = gradient
        self.leadingAction = leadingAction
        self.trailingAction = trailingAction
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            gradient.ignoresSafeArea(edges: .top)
            shadow
            content
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}

extension GradientHeader {
    private var shadow: some View {
        Rectangle()
            .fill(Color.black.opacity(0.3))
             .frame(height: 2)
             .blur(radius: 4)
             .offset(y: 1)
    }

    private var content: some View {
        VStack {
            HStack(spacing: Dimensions.Stacks.normal) {
                IconButton(
                    icon: Image("components-icon"),
                    width: Dimensions.Icon.largeSize,
                    height: Dimensions.Icon.largeSize,
                    action: leadingAction
                )
                VStack {
                    MyText(text: "Recibe en Las Condes", font: Fonts.SwiftUIFont.heading4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    MyText(text: "Ingrese ubicación", font: Fonts.SwiftUIFont.heading3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                IconButton(
                    icon: Image(systemName: "person"),
                    width: Dimensions.Icon.tinySmall,
                    height: Dimensions.Icon.tinySmall,
                    action: trailingAction
                )
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
    }
}
