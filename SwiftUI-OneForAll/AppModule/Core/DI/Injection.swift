//
//  Injection.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation
import SwiftData

final class Injection: ObservableObject {
    static let shared = Injection()
    private let container: Container
    let controllerProvider: MainControllerProvider


    private init() {
        container = Container()
        controllerProvider = .init(container)
        injectAppModules()
        registerCoreServices()
    }
    
    private func injectAppModules() {
        MainTabModule(container).inject()
        UIComponentsModule(container).inject()
        FunctionalitiesModule(container).inject()
    }

    private func registerCoreServices() {
        container.registrar(MainControllerProvider.self) { container in
            MainControllerProvider(container)
        }
    }
    
    func getContainer() -> Container {
        return container
    }

    func registerInitialDependencies(modelContext: ModelContext) {
        container.registrar(ModelContext.self) { _ in
            modelContext
        }
    }
    
    func resolve<T>(_ serviceType: T.Type) -> T {
        guard let service = container.obtener(serviceType) else {
            fatalError("No se pudo resolver el tipo de servicio \(serviceType)")
        }
        return service
    }
}
