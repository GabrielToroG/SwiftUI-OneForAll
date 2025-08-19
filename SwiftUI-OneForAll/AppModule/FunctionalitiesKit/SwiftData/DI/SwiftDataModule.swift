//
//  SwiftDataModule.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 27-07-25.
//

import SwiftData

final class SwiftDataModule {
    private let container: Container
    init(_ container: Container) {
        self.container = container
    }

    func inject() {
        container.registrar(SwiftDataLocalDataSource.self) { resolver in
            let context = resolver.obtener(ModelContext.self)
            return SwiftDataLocalDataSourceImpl(modelContext: context)
        }

        container.registrar(SwiftDataDataMapper.self) { _ in
            SwiftDataDataMapperImpl()
        }

        container.registrar(SwiftDataRepository.self) { resolver in
            let local = resolver.obtener(SwiftDataLocalDataSource.self)
            let mapper = resolver.obtener(SwiftDataDataMapper.self)
            return SwiftDataRepositoryImpl(local: local, mapper: mapper)
        }

        container.registrar(GetAllVideosUseCase.self) { resolver in
            let repository = resolver.obtener(SwiftDataRepository.self)
            return GetAllVideosUseCase(repository: repository)
        }

        container.registrar(DeleteAllVideosUseCase.self) { resolver in
            let repository = resolver.obtener(SwiftDataRepository.self)
            return DeleteAllVideosUseCase(repository: repository)
        }

        container.registrar(AddVideoUseCase.self) { resolver in
            let repository = resolver.obtener(SwiftDataRepository.self)
            return AddVideoUseCase(repository: repository)
        }

        container.registrar(ToggleFavoriteUseCase.self) { resolver in
            let repository = resolver.obtener(SwiftDataRepository.self)
            return ToggleFavoriteUseCase(repository: repository)
        }

        container.registrar(SwiftDataPresentationMapper.self) { _ in
            SwiftDataPresentationMapperImpl()
        }

        container.registrarUna(SwiftDataViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            let getAll = resolver.obtener(GetAllVideosUseCase.self)
            let deleteAll = resolver.obtener(DeleteAllVideosUseCase.self)
            let add = resolver.obtener(AddVideoUseCase.self)
            let mapper = resolver.obtener(SwiftDataPresentationMapper.self)
            return SwiftDataViewModel(
                coordinator: coordinator,
                getAllVideosUseCase: getAll,
                deleteAllVideosUseCase: deleteAll,
                addVideoUseCase: add,
                mapper: mapper
            )
        }

        container.registrarUna(SwiftDataView.self) { (resolver, coordinator: FunctionalitiesCoordinator) in
            let viewModel = resolver.obtenerUna(SwiftDataViewModel.self, argument: coordinator)
            return SwiftDataView(viewModel: viewModel)
        }

        container.registrarDos(SwiftDataFavoriteViewModel.self) { (resolver, coordinator: FunctionalitiesCoordinator, video: UiSwiftDataVideo) in
            let toggle = resolver.obtener(ToggleFavoriteUseCase.self)
            return SwiftDataFavoriteViewModel(
                coordinator: coordinator,
                video: video,
                toggleFavorite: toggle
            )
        }

        container.registrarDos(SwiftDataFavoriteView.self) { (resolver, coordinator: FunctionalitiesCoordinator, video: UiSwiftDataVideo) in
            let viewModel = resolver.obtenerDos(SwiftDataFavoriteViewModel.self, argument1: coordinator, argument2: video)
            return SwiftDataFavoriteView(viewModel: viewModel)
        }
    }
}
