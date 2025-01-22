//
//  Injection.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation

final class Injection: ObservableObject {
    static let shared = Injection()
    private let container: Container
    let controllerProvider: MainControllerProvider


    private init() {
        container = Container()
        controllerProvider = .init(container)
        injectDependencies()
    }
    
    private func injectDependencies() {
        MainTabModule(container).inject()
        UIComponentsModule(container).inject()
        FunctionalitiesModule(container).inject()
    }
    
    func getContainer() -> Container {
        return container
    }
    
    func resolve<T>(_ serviceType: T.Type) -> T {
        guard let service = container.obtener(serviceType) else {
            fatalError("No se pudo resolver el tipo de servicio \(serviceType)")
        }
        return service
    }
}
