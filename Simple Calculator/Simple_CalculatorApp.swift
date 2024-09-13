//
//  Simple_CalculatorApp.swift
//  Simple Calculator
//
//  Created by Oncu Can on 27.08.2024.
//

import SwiftUI

@main
struct Simple_CalculatorApp: App {
    
    func setupTabBarAppearance(selectedColor: UIColor, unselectedColor: UIColor, backgroundColor: UIColor) {
        let appearance = UITabBarAppearance()
        
        appearance.backgroundColor = backgroundColor
        
        appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: selectedColor]
        
        appearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedColor]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}


