//
//  SwiftDataMapperImpl.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

final class SwiftDataDataMapperImpl: SwiftDataDataMapper {
    func dataToDomain(_ value: [ApiSwiftDataVideo]) -> [DomainSwiftDataVideo] {
        value.compactMap(dataToDomain(_:))
    }

    private func dataToDomain(_ value: ApiSwiftDataVideo) -> DomainSwiftDataVideo {
        return DomainSwiftDataVideo(
            id: value.id,
            title: value.title,
            isFavorite: value.metadata.isFavorite
        )
    }

    func domainToData(_ value: DomainSwiftDataVideo) -> ApiSwiftDataVideo {
        return ApiSwiftDataVideo(
            title: value.title,
            metadata: ApiSwiftDataMeta(
                isFavorite: value.isFavorite
            )
        )
    }
}
