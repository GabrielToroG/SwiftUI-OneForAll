//
//  SwiftDataView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 17-06-25.
//

import SwiftUI
import SwiftData

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
            .toolbarTrailing { toolbarTrailing }
    }
}

extension SwiftDataView {
    var bodyContent: some View {
        List {
            ForEach(viewModel.videos) { video in
                HStack {
                    Text(video.title)
                    if video.metadata.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
                .onTapGesture {
                    viewModel.coordinator.goSwiftDataFavorite(video: video)
                }
            }
        }.onAppear {
            viewModel.getVideos()
        }
    }
}

extension SwiftDataView {
    var toolbarTrailing: some View {
        HStack {
            Button {
                withAnimation {
                    let newVideo = UiSwiftDataVideo(
                        id: .init(),
                        title: "Test",
                        metadata: .init(isFavorite: true)
                    )
                    viewModel.insert(video: newVideo)
                }
            } label: {
                Label("add Item", systemImage: "plus")
            }

            Button {
                withAnimation {
                    viewModel.deleteAllVideos()
                }
            } label: {
                Label("Remove Item", systemImage: "trash")
            }
        }
        
    }
}
