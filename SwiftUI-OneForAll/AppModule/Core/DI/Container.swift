//
//  Container.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import Foundation

/// Container ahora arroja errores más claros para un mejor debug, tampoco permite que se sobreescriban servicios a menos que lo indiques con allowOverride
final class Container {
    private var services = [String: Any]()
}

// MARK: - Register
extension Container {
    /// (register) Registro de entidad sin argumentos
    func registrar<Service>(
        _ serviceType: Service.Type,
        allowOverride: Bool = false,
        factory: @escaping (Container) -> Service
    ) {
        let key = String(describing: serviceType)
        if services[key] != nil && !allowOverride {
            fatalError("❌ [DI Error] Ya existe un registro para '\(serviceType)' sin argumentos.")
        }
        services[key] = AnyFactory.noArgs(factory)
    }

    /// (register) Registro de entidad con 1 argumento
    func registrarUna<Service, Arg>(
        _ serviceType: Service.Type,
        allowOverride: Bool = false,
        factory: @escaping (Container, Arg) -> Service
    ) {
        let key = String(describing: serviceType) + String(describing: Arg.self)
        if services[key] != nil && !allowOverride {
            fatalError("❌ [DI Error] Ya existe un registro para '\(serviceType)' con argumento '\(Arg.self)'.")
        }
        services[key] = AnyFactory.withArg { container, arg in
            guard let arg = arg as? Arg else {
                fatalError("❌ [DI Error] Argumento inválido al registrar '\(serviceType)': se esperaba tipo '\(Arg.self)', pero se recibió '\(type(of: arg))'")
            }
            return factory(container, arg)
        }
    }


    /// (register) Registro de entidad con 2 argumentos
    func registrarDos<Service, Arg1, Arg2>(
        _ serviceType: Service.Type,
        allowOverride: Bool = false,
        factory: @escaping (Container, Arg1, Arg2) -> Service
    ) {
        let key = String(describing: serviceType) + String(describing: Arg1.self) + String(describing: Arg2.self)
        if services[key] != nil && !allowOverride {
            fatalError("❌ [DI Error] Ya existe un registro para '\(serviceType)' con argumentos '\(Arg1.self)', '\(Arg2.self)'.")
        }
        services[key] = AnyFactory.withTwoArgs { container, arg1, arg2 in
            guard let arg1 = arg1 as? Arg1, let arg2 = arg2 as? Arg2 else {
                fatalError("❌ [DI Error] Argumentos inválidos al registrar '\(serviceType)': se esperaban tipos '\(Arg1.self)', '\(Arg2.self)'")
            }
            return factory(container, arg1, arg2)
        }
    }
}

// MARK: - Resolve
extension Container {
    /// (resolve) Resolver sin argumento adicional
//    func obtener<Service>(_ serviceType: Service.Type) -> Service? {
//        let key = String(describing: serviceType)
//        guard let factory = services[key] as? AnyFactory else { return nil }
//        return factory.resolve(container: self) as? Service
//    }

    /// (resolve) Resolver con un argumento adicional
//    func obtenerUna<Service, Arg>(_ serviceType: Service.Type, argument: Arg) -> Service? {
//        let key = String(describing: serviceType) + String(describing: Arg.self)
//        guard let factory = services[key] as? AnyFactory else { return nil }
//        return factory.resolveWithArg(container: self, argument: argument) as? Service
//    }

    /// (resolve) Resolver con dos argumentos adicionales
//    func obtenerDos<Service, Arg1, Arg2>(_ serviceType: Service.Type, argument1: Arg1, argument2: Arg2) -> Service? {
//        let key = String(describing: serviceType) + String(describing: Arg1.self) + String(describing: Arg2.self)
//        guard let factory = services[key] as? AnyFactory else { return nil }
//        return factory.resolveWithTwoArgs(container: self, argument1: argument1, argument2: argument2) as? Service
//    }

    func obtener<Service>(_ serviceType: Service.Type) -> Service {
        let key = String(describing: serviceType)
        guard let factory = services[key] as? AnyFactory else {
            fatalError("❌ [DI Error] '\(serviceType)' no fue registrado sin argumentos. Usa registrar(_:factory:) o revisa la clave '\(key)'.")
        }
        switch factory {
        case .noArgs(let resolve):
            return resolve(self) as! Service
        default:
            fatalError("❌ [DI Error] '\(serviceType)' fue registrado con argumentos, pero se intentó obtener sin argumentos. Usa obtenerUna(...) o obtenerDos(...).")
        }
    }

    func obtenerUna<Service, Arg>(_ serviceType: Service.Type, argument: Arg) -> Service {
        let key = String(describing: serviceType) + String(describing: Arg.self)
        guard let factory = services[key] as? AnyFactory else {
            fatalError("❌ [DI Error] '\(serviceType)' con argumento '\(Arg.self)' no fue registrado. Usa registrarUna(_:factory:) o revisa el tipo.")
        }
        switch factory {
        case .withArg(let resolve):
            return resolve(self, argument) as! Service
        default:
            fatalError("❌ [DI Error] '\(serviceType)' fue registrado sin argumentos o con múltiples, pero se intentó obtener con uno. Revisa la configuración.")
        }
    }

    func obtenerDos<Service, Arg1, Arg2>(_ serviceType: Service.Type, argument1: Arg1, argument2: Arg2) -> Service {
        let key = String(describing: serviceType) + String(describing: Arg1.self) + String(describing: Arg2.self)
        guard let factory = services[key] as? AnyFactory else {
            fatalError("❌ [DI Error] '\(serviceType)' con argumentos '\(Arg1.self)', '\(Arg2.self)' no fue registrado. Usa registrarDos(_:factory:).")
        }
        switch factory {
        case .withTwoArgs(let resolve):
            return resolve(self, argument1, argument2) as! Service
        default:
            fatalError("❌ [DI Error] '\(serviceType)' fue registrado con diferente número de argumentos. Revisa la clave y el tipo.")
        }
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
