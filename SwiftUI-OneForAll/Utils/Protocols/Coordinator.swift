//
//  Coordinator.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

protocol Coordinator: ObservableObject {
    associatedtype CoordinatorSteps: Route
    associatedtype CoordinatorView: View

    var path: [CoordinatorSteps] { get set }

    func redirect(_ path: CoordinatorSteps) -> CoordinatorView
}
