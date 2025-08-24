//
//  ToastStyle.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//

import SwiftUI

enum ToastStyle {
    case success, warning, error, info
    
    var backgroundColor: Color {
        switch self {
        case .success: return .green.opacity(0.90)
        case .warning: return .yellow.opacity(0.90)
        case .error:   return .red.opacity(0.90)
        case .info:    return .blue.opacity(0.90)
        }
    }
    var icon: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .error:   return "xmark.octagon.fill"
        case .info:    return "info.circle.fill"
        }
    }
}
