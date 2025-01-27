//
//  ImageView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-01-25.
//

import SwiftUI

struct ImageView: View {
    @StateObject var viewModel: ImageViewModel
    let url: String = "https://cdn-www.bluestacks.com/bs-images/Ragnarok-Origin_Beginners-Guide_ES_21.png"
    
    init(viewModel: ImageViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        bodyContent
        .toolbarLeading { toolbarLeading }
        .navigationTitle("Imagenes")
    }
}

// MARK: - Body Content
extension ImageView {
    var bodyContent: some View {
        VStack(spacing: Dimensions.Margin.normal) {
            localImage
            alphaImage
            urlImage
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.all, Dimensions.Margin.normal)
        .background(Color.brandColor)
    }
}

// MARK: - Content|
extension ImageView {
    var localImage: some View {
        Image("images.webpage")
            .resizable()
            .foregroundColor(Color.blackColor)
            .frame(width: Dimensions.Images.bigSize, height: Dimensions.Images.bigSize)
    }

    var alphaImage: some View {
        Image("images.webpage")
            .resizable()
            .foregroundColor(Color.blackColor)
            .opacity(Dimensions.Alpha.normal)
            .frame(width: Dimensions.Images.bigSize, height: Dimensions.Images.bigSize)
    }

    var urlImage: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(width: Dimensions.Images.bigSize, height: Dimensions.Images.bigSize)
            case .success(let image):
                image
                    .resizable()
                    .frame(width: Dimensions.Images.bigSize, height: Dimensions.Images.bigSize)
            case .failure(let error):
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: Dimensions.Images.bigSize, height: Dimensions.Images.bigSize)
                    .foregroundColor(.gray)
            @unknown default:
                EmptyView()
            }
        }
    }
}

// MARK: - Header
extension ImageView {
    var toolbarLeading: some View {
        Button {
            viewModel.coordinator.goBack()
            print("AJAJAJA")
        } label: {
            HStack {
                Text("< ")
                Text("Atrás")
            }
        }
    }
}

#Preview {
    ImageView(viewModel: .init(coordinator: .init(container: .init())))
}
