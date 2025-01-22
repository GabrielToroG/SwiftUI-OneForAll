//
//  UIComponentsView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

struct UIComponentsView: View {
    @ObservedObject var viewModel: UIComponentsViewModel
    
    var body: some View {
        VStack {
            Text("Items Tab")
            Button("Go to Item Detail") {
                viewModel.coordinator.navigateToFirst()
            }
        }
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}
