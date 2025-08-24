//
//  ToastMenuView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 23-08-25.
//

import SwiftUI

struct ToastMenuView: View {
    
    @StateObject var viewModel: ToastMenuViewModel
    @State private var showToast = false
    
    init(viewModel: ToastMenuViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        bodyContent
            .applyNavigation(coordinator: viewModel.coordinator)
    }
}

extension ToastMenuView {
    var bodyContent: some View {
        CustomVStack {
            Button("Mostrar Toast Arriba") {
                viewModel.updateShowToast(true)
            }
        }
        .toast(
             isPresented: $viewModel.showToast,
             style: .success,
             message: "Guardado con éxito",
             position: .bottom,
             behavior: .autoAndTap
         )
    }
}
