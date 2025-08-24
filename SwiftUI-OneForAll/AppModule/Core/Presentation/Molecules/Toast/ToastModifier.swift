//
//  ToastModifier.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 24-08-25.
//
import SwiftUI

struct ToastModifier: ViewModifier {
    @Binding var isPresented: Bool
    let style: ToastStyle
    let message: String
    let position: ToastPosition
    let behavior: ToastBehavior
    
    /// Programación idempotente del auto-cierre (no se reinicia con múltiples clics)
    @State private var dismissWorkItem: DispatchWorkItem?

    func body(content: Content) -> some View {
        ZStack {
            content
                .zIndex(0)
            
            if isPresented {
                VStack {
                    if position == .top { toastView; Spacer() }
                    else { Spacer(); toastView }
                }
                .transition(
                    .asymmetric(
                        insertion: .move(edge: position == .top ? .top : .bottom).combined(with: .opacity),
                        removal: .opacity.combined(with: .offset(y: position == .top ? -10 : 10))
                    )
                )
                .animation(.easeInOut(duration: 0.35), value: isPresented)
                .zIndex(1)
            }
        }
        // Programamos el auto-cierre SOLO cuando pasa de false -> true
        .onChange(of: isPresented) { newValue in
            if newValue {
                scheduleAutoDismissIfNeeded()
            } else {
                cancelDismissWorkItem()
            }
        }
    }
    
    private var toastView: some View {
        ToastView(style: style, message: message)
            .onTapGesture {
                guard behavior.dismissOnTap else { return }
                cancelDismissWorkItem()
                withAnimation { isPresented = false }
            }
            .padding(.bottom, position == .bottom ? 16 : 0) // 👈 margen mayor
            .safeAreaPadding(position == .top ? .top : .bottom, 8)
    }
    
    private func scheduleAutoDismissIfNeeded() {
        guard behavior.autoDismiss else { return }
        // Si ya hay un work item activo, NO lo reiniciamos (evita “quedarse pegado” por spam)
        guard dismissWorkItem == nil else { return }
        
        let work = DispatchWorkItem {
            // Si el toast sigue visible cuando expire el tiempo, lo cerramos
            if isPresented {
                DispatchQueue.main.async {
                    withAnimation { isPresented = false }
                }
            }
            // Limpieza del ciclo
            dismissWorkItem = nil
        }
        dismissWorkItem = work
        DispatchQueue.main.asyncAfter(deadline: .now() + behavior.duration, execute: work)
    }
    
    private func cancelDismissWorkItem() {
        dismissWorkItem?.cancel()
        dismissWorkItem = nil
    }
}
