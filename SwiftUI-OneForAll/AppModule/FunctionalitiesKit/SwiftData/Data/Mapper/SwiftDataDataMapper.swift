//
//  SwiftDataMapper.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 19-06-25.
//

protocol SwiftDataMapper {
    func domainToData(_ value: DomainHomeMenuRequest) -> ApiHomeMenuRequest
    func dataToDomain(_ value: ApiHomeMenu) -> DomainHomeMenu
}
