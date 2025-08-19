//
//  MainTabView.swift
//  SwiftUI-OneForAll
//
//  Created by Gabriel Alonso Toro Guzmán on 21-01-25.
//

import SwiftUI

struct MainTabView: View {
    let controllerProvider: MainControllerProvider

    var body: some View {
        TabView {
            controllerProvider.getUIComponentsTab()
                .tabItem {
                    Label("UIComponents", image: "components-icon")
                }

            controllerProvider.getFunctionalitiesTab()
                .tabItem {
                    Label("Funcionalidades", image: "functionalities-icon")
                }
        }
    }
}
