//
//  LabelView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-01-25.
//

import SwiftUI

struct LabelView: View {
    @StateObject var viewModel: LabelViewModel

    init(viewModel: LabelViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        bodyContent
        .toolbarLeading { toolbarLeading }
        .navigationTitle("Etiquetas")
    }
}

// MARK: - Body Content
extension LabelView {
    var bodyContent: some View {
        VStack(alignment: .leading, spacing: Dimensions.Margin.normal) {
            strikethroughText
            maxWidthText
            concatText
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.all, Dimensions.Margin.normal)
        .background(Color.brandColor)
    }
}

// MARK: - Content
extension LabelView {
    var strikethroughText: some View {
        MyText(
            text: "Tachado",
            font: Fonts.SwiftUIFont.body1,
            textColor: Color.red,
            useStrikethrough: true
        )
    }

    var maxWidthText: some View {
        HStack {
            MyText(
                text: "Texto tamaño máximo",
                font: Fonts.SwiftUIFont.body1,
                lines: Dimensions.Label.lines.one,
                backgroundColor: Color.gray
            ).frame(maxWidth: Dimensions.Label.Width.large)

            MyText(
                text: "Texto derecha",
                font: Fonts.SwiftUIFont.body1,
                backgroundColor: Color.yellow
            )
        }
    }

    var concatText: some View {
        MyConcatText(style: [
            MyConcatTextStyle(
                text: "Etiqueta con",
                font: Fonts.SwiftUIFont.body1,
                textColor: Color.blackColor
            ),
            MyConcatTextStyle(
                text: "diferentes estilos",
                font: Fonts.SwiftUIFont.body3,
                textColor: Color.brownColor
            )
        ])
    }
}

// MARK: - Header
extension LabelView {
    var toolbarLeading: some View {
        Button {
            viewModel.coordinator.goBack()
            print("AJAJAJA")
        } label: {
            HStack {
                Text("< ")
                Text("Atrás")
            }
        }
    }
}

#Preview {
    UIComponentsView(viewModel: .init(coordinator: .init(container: .init())))
}
