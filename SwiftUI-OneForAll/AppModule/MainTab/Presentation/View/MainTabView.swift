//
//  MainTabView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Injection.shared.controllerProvider.getUIComponentsTab()
                .tabItem {
                    Label("UIComponents", image: "components-icon")
                }
            
            Injection.shared.controllerProvider.getFunctionalitiesTab()
                .tabItem {
                    Label("Funcionalidades", image: "functionalities-icon")
                }
        }
    }
}
