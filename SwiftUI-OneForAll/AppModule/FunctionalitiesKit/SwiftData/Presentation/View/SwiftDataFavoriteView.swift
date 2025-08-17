//
//  SwiftDataFavoriteView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 18-06-25.
//

import SwiftUI

struct SwiftDataFavoriteView: View {
    
    @StateObject var viewModel: SwiftDataFavoriteViewModel
    
    init(viewModel: SwiftDataFavoriteViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        Form {
            TextField(
                "Editar el próximo video de Swift",
                text: $viewModel.video.title
            )
            Toggle("Video favorito", isOn: $viewModel.video.isFavorite)
                .onChange(of: viewModel.video.isFavorite, { oldValue, newValue in
                    Task {
                        await viewModel.toggleFavorite()
                    }
                })
        }
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}

extension SwiftDataFavoriteView {
    var bodyContent: some View {
        CustomVStack {
            Text("")
        }
    }
}
