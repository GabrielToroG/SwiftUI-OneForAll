//
//  ToastBehavior.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//

import Foundation

struct ToastBehavior {
    var autoDismiss: Bool = true
    var duration: TimeInterval = 3
    var dismissOnTap: Bool = true

    static let autoAndTap = ToastBehavior(autoDismiss: true, duration: 3, dismissOnTap: true)
    static let onlyTap    = ToastBehavior(autoDismiss: false, dismissOnTap: true)
    static let onlyAuto   = ToastBehavior(autoDismiss: true, duration: 3, dismissOnTap: false)
}
