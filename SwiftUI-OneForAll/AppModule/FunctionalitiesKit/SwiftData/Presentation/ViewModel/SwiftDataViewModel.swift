//
//  SwiftDataViewModel.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 17-06-25.
//

import SwiftUI
import SwiftData

protocol SwiftDataPresentationMapper {
    func domainToPresentation(_ value: [DomainSwiftDataVideo]) -> [UiSwiftDataVideo]
    func presentationToDomain(_ value: UiSwiftDataVideo) -> DomainSwiftDataVideo
}

final class SwiftDataPresentationMapperImpl: SwiftDataPresentationMapper {
    func domainToPresentation(_ value: [DomainSwiftDataVideo]) -> [UiSwiftDataVideo] {
        value.compactMap(domainToPresentation(_:))
    }

    private func domainToPresentation(_ value: DomainSwiftDataVideo) -> UiSwiftDataVideo {
        return UiSwiftDataVideo(
            id: value.id,
            title: value.title,
            isFavorite: value.isFavorite,
            numberOfLikes: .zero
        )
    }

    func presentationToDomain(_ value: UiSwiftDataVideo) -> DomainSwiftDataVideo {
        return DomainSwiftDataVideo(
            id: value.id,
            title: value.title,
            isFavorite: value.isFavorite
        )
    }
}


final class SwiftDataViewModel: ObservableObject {
    @Published var coordinator: FunctionalitiesCoordinator
    private var getAllVideosUseCase: GetAllVideosUseCase
    private var deleteAllVideosUseCase: DeleteAllVideosUseCase
    private var addVideoUseCase: AddVideoUseCase
    private var mapper: SwiftDataPresentationMapper
    @Published var videos: [UiSwiftDataVideo] = []
    init(
        coordinator: FunctionalitiesCoordinator,
        getAllVideosUseCase: GetAllVideosUseCase,
        deleteAllVideosUseCase: DeleteAllVideosUseCase,
        addVideoUseCase: AddVideoUseCase,
        mapper: SwiftDataPresentationMapper
    ) {
        self.coordinator = coordinator
        self.getAllVideosUseCase = getAllVideosUseCase
        self.deleteAllVideosUseCase = deleteAllVideosUseCase
        self.addVideoUseCase = addVideoUseCase
        self.mapper = mapper
    }
}

extension SwiftDataViewModel {
    @MainActor
    func fetchVideos() async {
        do {
            let result = try await getAllVideosUseCase.execute()
            videos = mapper.domainToPresentation(result)
        } catch {
            print("Error loading videos: \(error)")
        }
    }

    @MainActor
    func addNewVideo() async {
        let newVideo = UiSwiftDataVideo(id: UUID(), title: "New Video", isFavorite: false, numberOfLikes: .zero)
        let domainVideo = mapper.presentationToDomain(newVideo)
        try? await addVideoUseCase.execute(video: domainVideo)
        await fetchVideos()
    }

    @MainActor
    func removeAllVideos() async {
        try? await deleteAllVideosUseCase.execute()
        await fetchVideos()
    }
}
