//
//  UIComponentsView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

struct UIComponentsView: View {
    @StateObject var viewModel: UIComponentsViewModel

    init(viewModel: UIComponentsViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        bodyContent
        .background(Color.brandColor)
        .navigationTitle("UIComponents")
        .navigationBarTitleDisplayMode(.large)
        .applyNavigation(coordinator: viewModel.coordinator)
        .onAppear {
            setupNavigationBarAppearance()
        }
    }
}

extension UIComponentsView {
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
extension UIComponentsView {
    private func destinationView(for index: Int) {
        switch index {
        case 0:
            viewModel.coordinator.navigateToLabel()
        case 1:
            viewModel.coordinator.navigateToImage()
        case 2:
            viewModel.coordinator.navigateToButton()
        default:
            print("No está implementado todavia")
        }
    }
}

#Preview {
    UIComponentsView(viewModel: .init(coordinator: .init(container: .init())))
}
