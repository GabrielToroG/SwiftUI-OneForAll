//
//  SwiftDataDomainMapperImpl.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 16-07-25.
//

final class SwiftDataDomainMapperImpl {
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
        DomainSwiftDataVideo(
            id: value.id,
            title: value.title,
            isFavorite: value.isFavorite
        )
    }
}
