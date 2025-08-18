# 📘 SwiftUI-AllForOne: Naming Conventions & Architecture Style Guide

Este documento define las convenciones de nombres y estilo de arquitectura utilizadas en el proyecto **SwiftUI-AllForOne**, aplicando Clean Architecture, MVVM, DDD y patrones avanzados de diseño como Coordinador, Observador, Inyección e Inversión de dependencias, y Atomic Design.

---

## 🧱 Arquitectura General

- Clean Architecture + MVVM + Domain-Driven Design
- Modularización por dominio y funcionalidad
- Patrón Coordinador para navegación
- Uso de Combine para observabilidad
- DI (Dependency Injection) centralizado con `Container`
- Atomic Design: Atom / Molecule / Organism

---

## 📦 Convenciones de Nombres

### 🔹 Protocolos

- Los protocolos deben representar comportamientos o responsabilidades, no su estructura técnica.
- **Evitar sufijos como** `Protocol`, `Interface`, `Impl`, o `-ing`.
- Usar nombres claros, semánticos y orientados a dominio.

**✅ Ejemplos correctos:**
```swift
protocol UserRepository
protocol LoginCoordinator
protocol AuthService
protocol DomainMapper
```

**❌ Ejemplos incorrectos:**
```swift
protocol UserRepositoryProtocol
protocol LoginCoordinatorProtocol
protocol AuthServiceInterface
protocol LoginCoordinating
```

---

### 🔸 Implementaciones

- La implementación principal del protocolo debe llevar el prefijo `Main`, para expresar que es la versión usada por la app en producción.
- Implementaciones alternativas pueden usar prefijos como `Mock`, `Failing`, `Local`, `Remote`, etc.
- Esto aplica de forma **consistente a coordinadores, mappers, repositorios, servicios, etc.**

**✅ Ejemplos recomendados:**
```swift
class MainUserRepository: UserRepository
class MockUserRepository: UserRepository
class FailingLoginCoordinator: LoginCoordinator
class RemoteVideoRepository: VideoRepository
class MainDomainMapper: DomainMapper
class MainLoginCoordinator: LoginCoordinator
```

---

## 🧩 Coordinadores

- Los coordinadores siguen la misma convención:
  - El **protocolo** usa el nombre funcional: `LoginCoordinator`, `SettingsCoordinator`, etc.
  - La **implementación principal** lleva el prefijo `Main`
  
```swift
protocol LoginCoordinator
class MainLoginCoordinator: LoginCoordinator

protocol SettingsCoordinator
class MainSettingsCoordinator: SettingsCoordinator
```

---

## 🗃️ Registro en el Contenedor

**Registro estándar:**
```swift
container.registrar(UserRepository.self) {
    MainUserRepository()
}
```

**Override para tests:**
```swift
container.override(UserRepository.self) {
    MockUserRepository()
}
```

---

## 🧪 Test Doubles

- `Mock`: comportamiento simulado o controlado
- `Failing`: simula errores
- `InMemory`: sin persistencia

```swift
class MockAuthService: AuthService
class FailingLoginCoordinator: LoginCoordinator
```

---

## 📁 Organización por módulo

Cada módulo funcional (`Login`, `User`, `MainTab`, etc.) debe tener su propio archivo de DI (`ModuleNameModule.swift`) donde se registran sus dependencias:

```swift
struct LoginModule {
    let container: Container

    func inject() {
        container.registrar(LoginCoordinator.self) {
            MainLoginCoordinator(container: container)
        }
        container.registrar(DomainMapper.self) {
            MainLoginDomainMapper()
        }
    }
}
```

---

## ✅ Conclusión

Este estilo permite una arquitectura limpia, escalable, testeable y profesional, aplicando estándares iOS modernos y prácticas recomendadas por equipos senior.

Mantén consistencia, simplicidad y foco en la expresividad del dominio.

> "Clarity at the point of use is more important than brevity at the point of declaration." – Swift API Guidelines
