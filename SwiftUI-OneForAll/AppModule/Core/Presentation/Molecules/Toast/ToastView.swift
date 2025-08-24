//
//  ToastView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//
import SwiftUI

struct ToastView: View {
    let style: ToastStyle
    let message: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: style.icon)
                .foregroundColor(.white)
            Text(message)
                .foregroundColor(.white)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
                .lineLimit(3)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(style.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .shadow(radius: 5)
        .padding(.horizontal, 16)
    }
}
