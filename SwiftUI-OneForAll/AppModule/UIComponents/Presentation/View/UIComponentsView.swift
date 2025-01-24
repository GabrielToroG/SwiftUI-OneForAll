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
            List(viewModel.options, id: \.self) { option in
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
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    UIComponentsView(viewModel: .init(coordinator: .init(container: .init())))
}
