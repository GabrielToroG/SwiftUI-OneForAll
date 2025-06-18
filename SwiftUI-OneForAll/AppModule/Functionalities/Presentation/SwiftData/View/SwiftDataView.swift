//
//  SwiftDataView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 17-06-25.
//

import SwiftUI

/*
 - Todos los que quieren usar Swift Data tienen que estar
 dentro de un Container

 - El Contexto es lo que nos permite interactuar con nuestra
 base de datos, haciendo peticiones, etc.
*/
struct SwiftDataView: View {
    
    @StateObject var viewModel: SwiftDataViewModel
    
    init(viewModel: SwiftDataViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    var body: some View {
        bodyContent
            .applyNavigation(coordinator: viewModel.coordinator)
    }
}

extension SwiftDataView {
    var bodyContent: some View {
        CustomVStack {
            Text("")
        }
    }
}
