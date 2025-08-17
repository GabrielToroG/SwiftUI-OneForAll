//
//  SwiftDataDomainMapper.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 16-07-25.
//

protocol SwiftDataDomainMapper {
    func domainToPresentation(_ value: [DomainSwiftDataVideo]) -> [UiSwiftDataVideo]
    func presentationToDomain(_ value: UiSwiftDataVideo) -> DomainSwiftDataVideo
}
