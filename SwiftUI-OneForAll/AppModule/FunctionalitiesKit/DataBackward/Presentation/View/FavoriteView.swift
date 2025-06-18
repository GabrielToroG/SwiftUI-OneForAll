//
//  FavoriteView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 26-01-25.
//

import SwiftUI

struct FavoriteView: View {
    @StateObject var viewModel: FavoriteViewModel

    init(viewModel: FavoriteViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        bodyContent
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}

extension FavoriteView {
    var bodyContent: some View {
        VStack {
            Button {
                viewModel.toggleFavorite()
            } label: {
                if viewModel.isFavoriteState {
                    Image(systemName: "star.fill")
                        .resizable()
                } else {
                    Image(systemName: "star")
                        .resizable()
                }
            }
            .frame(width: Dimensions.Images.bigSize, height: Dimensions.Images.bigSize)
        }
    }
}

