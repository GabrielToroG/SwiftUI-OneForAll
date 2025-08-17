//
//  SwiftDataDataMapper.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

import Foundation

protocol SwiftDataDataMapper {
    func dataToDomain(_ value: [ApiSwiftDataVideo]) -> [DomainSwiftDataVideo]
    func domainToData(_ value: DomainSwiftDataVideo) -> ApiSwiftDataVideo
}
