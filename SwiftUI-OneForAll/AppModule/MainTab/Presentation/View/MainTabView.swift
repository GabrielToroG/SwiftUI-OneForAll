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
                    Label("Tab 1", systemImage: "1.circle")
                }
            
            Injection.shared.controllerProvider.getFunctionalitiesTab()
                .tabItem {
                    Label("Tab 2", systemImage: "2.circle")
                }
        }
    }
}
