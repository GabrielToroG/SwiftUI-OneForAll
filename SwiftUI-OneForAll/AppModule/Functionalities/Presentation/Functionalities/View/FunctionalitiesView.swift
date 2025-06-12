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
            .background(Color.brandColor)
            .navigationTitle("Funcionalidades")
            .navigationBarTitleDisplayMode(.large)
            .applyNavigation(coordinator: viewModel.coordinator)
    }
}

extension FunctionalitiesView {
    var bodyContent: some View {
        VStack {
            List(Array(viewModel.options.enumerated()), id: \.0) { index, option in
                HStack(spacing: Dimensions.Margin.normal) {
                    Image(option.icon)
                        .resizable()
                        .foregroundColor(Color.blackColor)
                        .frame(width: Dimensions.Icon.smallSize, height: Dimensions.Icon.smallSize)
                    Text(option.title)
                        .font(.system(size: 17))
                        .foregroundColor(Color.blackColor)
                }
                .padding(.horizontal, Dimensions.Margin.normal)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
                .onTapGesture {
                    destinationView(for: index)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
    }
}

// MARK: - Actions
extension FunctionalitiesView {
    private func destinationView(for index: Int) {
        switch index {
        case 0:
            viewModel.coordinator.goToCustomHeader()
        case 1:
            viewModel.coordinator.goToDataBackward()
        default:
            print("No está implementado todavia")
        }
    }
}
