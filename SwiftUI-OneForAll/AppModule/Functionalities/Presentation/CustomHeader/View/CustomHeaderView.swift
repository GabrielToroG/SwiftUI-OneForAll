//
//  CustomHeaderView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-05-25.
//

import SwiftUI

struct CustomHeaderView: View {
    @StateObject var viewModel: CustomHeaderViewModel

    init(viewModel: CustomHeaderViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        bodyContent
            .navigationBarHidden(true)
            .applyNavigation(coordinator: viewModel.coordinator)
    }
}

extension CustomHeaderView {
    var bodyContent: some View {
        VStack(spacing: 0) {
            GradientHeader(
                leadingAction: { viewModel.coordinator.goBack() },
                trailingAction: {}
            )
            ScrollView {
                Text("Contenido debajo del header")
                .padding()
            }
        }
    }
}
