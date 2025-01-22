//
//  Container.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation

final class Container {
    private var services = [String: Any]()
}

// MARK: - Register
extension Container {
    /// (register) Registro de entidad sin argumentos
    func registrar<Service>(
        _ serviceType: Service.Type,
        factory: @escaping (Container) -> Service
    ) {
        let key = String(describing: serviceType)
        services[key] = AnyFactory.noArgs(factory)
    }

    /// (register) Registro de entidad con 1 argumento
    func registrarUna<Service, Arg>(
        _ serviceType: Service.Type,
        factory: @escaping (Container, Arg) -> Service
    ) {
        let key = String(describing: serviceType) + String(describing: Arg.self)
        services[key] = AnyFactory.withArg { container, arg in
            guard let arg = arg as? Arg else {
                fatalError("Argumento proporcionado no es del tipo esperado \(Arg.self)")
            }
            return factory(container, arg)
        }
    }

    /// (register) Registro de entidad con 2 argumentos
    func registrarDos<Service, Arg1, Arg2>(
        _ serviceType: Service.Type,
        factory: @escaping (Container, Arg1, Arg2) -> Service
    ) {
        let key = String(describing: serviceType) + String(describing: Arg1.self) + String(describing: Arg2.self)
        services[key] = AnyFactory.withTwoArgs { container, arg1, arg2 in
            guard let arg1 = arg1 as? Arg1, let arg2 = arg2 as? Arg2 else {
                fatalError("Los argumentos proporcionados no son del tipo esperado \(Arg1.self), \(Arg2.self)")
            }
            return factory(container, arg1, arg2)
        }
    }
}

// MARK: - Resolve
extension Container {
    /// (resolve) Resolver sin argumento adicional
    func obtener<Service>(_ serviceType: Service.Type) -> Service? {
        let key = String(describing: serviceType)
        guard let factory = services[key] as? AnyFactory else { return nil }
        return factory.resolve(container: self) as? Service
    }

    /// (resolve) Resolver con un argumento adicional
    func obtenerUna<Service, Arg>(_ serviceType: Service.Type, argument: Arg) -> Service? {
        let key = String(describing: serviceType) + String(describing: Arg.self)
        guard let factory = services[key] as? AnyFactory else { return nil }
        return factory.resolveWithArg(container: self, argument: argument) as? Service
    }

    /// (resolve) Resolver con dos argumentos adicionales
    func obtenerDos<Service, Arg1, Arg2>(_ serviceType: Service.Type, argument1: Arg1, argument2: Arg2) -> Service? {
        let key = String(describing: serviceType) + String(describing: Arg1.self) + String(describing: Arg2.self)
        guard let factory = services[key] as? AnyFactory else { return nil }
        return factory.resolveWithTwoArgs(container: self, argument1: argument1, argument2: argument2) as? Service
    }
}

extension Container {
    private enum AnyFactory {
        case noArgs((Container) -> Any)
        case withArg((Container, Any) -> Any)
        case withTwoArgs((Container, Any, Any) -> Any)
        
        func resolve(container: Container) -> Any {
            switch self {
            case .noArgs(let factory):
                return factory(container)
            case .withArg, .withTwoArgs:
                fatalError("Este factory requiere uno o más argumentos adicionales. Usa resolve(_:argument:) o resolve(_:arguments:)")
            }
        }
        
        func resolveWithArg(container: Container, argument: Any) -> Any {
            switch self {
            case .noArgs:
                fatalError("Este factory no espera argumentos adicionales.")
            case .withArg(let factory):
                return factory(container, argument)
            case .withTwoArgs:
                fatalError("Este factory requiere dos argumentos adicionales. Usa resolve(_:arguments:)")
            }
        }
        
        func resolveWithTwoArgs(container: Container, argument1: Any, argument2: Any) -> Any {
            switch self {
            case .noArgs, .withArg:
                fatalError("Este factory requiere uno o ningún argumento adicional.")
            case .withTwoArgs(let factory):
                return factory(container, argument1, argument2)
            }
        }
    }
}
