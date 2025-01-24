//
//  FunctionalitiesView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

struct FunctionalitiesView: View {
    @StateObject var viewModel: FunctionalitiesViewModel

    init(viewModel: FunctionalitiesViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        bodyContent
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}

extension FunctionalitiesView {
    var bodyContent: some View {
        VStack {
            Text("Wallet Tab")
            Button("Go to wallet detail") {
                viewModel.coordinator.navigateToFirst()
            }
        }
    }
}
