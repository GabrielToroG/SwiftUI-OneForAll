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
        VStack {
            viewModel.isFavorite 
                ? Text("Esta agregado a favoritos!")
                : Text("Agrégalo a favoritos por favor!")

            Button("Go to favorite") {
                viewModel.coordinator.navigateToDataBackwardFavorite(isFavorite: $viewModel.isFavorite)
            }
        }
    }
}
