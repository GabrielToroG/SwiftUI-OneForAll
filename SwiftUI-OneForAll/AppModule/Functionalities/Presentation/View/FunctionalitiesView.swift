//
//  FunctionalitiesView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

struct FunctionalitiesView: View {
    @ObservedObject var viewModel: FunctionalitiesViewModel
    
    var body: some View {
        VStack {
            Text("Wallet Tab")
            Button("Go to wallet detail") {
                viewModel.coordinator.navigateToFirst()
            }
        }
        .applyNavigation(coordinator: viewModel.coordinator)
    }
}
