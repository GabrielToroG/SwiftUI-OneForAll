//
//  DataBackwardView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 26-01-25.
//

import SwiftUI

struct DataBackwardView: View {
    @StateObject var viewModel: DataBackwardViewModel

    init(viewModel: DataBackwardViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        bodyContent
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}

extension DataBackwardView {
    var bodyContent: some View {
        CustomVStack {
            titleText
            starIcon
            goToButton
            Spacer()
        }
    }
}

extension DataBackwardView {
    private var titleText: some View {
        viewModel.isFavorite
            ? Text("Esta agregado a favoritos!")
            : Text("Agrégalo a favoritos por favor!")
    }

    private var starIcon: some View {
        (viewModel.isFavorite
            ? Image(systemName: "star.fill")
            : Image(systemName: "star"))
        .resizable()
        .frame(
            width: Dimensions.Images.bigSize,
            height: Dimensions.Images.bigSize
        )
    }

    private var goToButton: some View {
        MyButton(
            text: "Go to favorite",
            style: .filled,
            action: {
                viewModel.coordinator.goToDataBackwardFavorite(
                    isFavorite: $viewModel.isFavorite
                )
            }
        )
    }
}
