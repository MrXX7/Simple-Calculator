//
//  Simple_CalculatorApp.swift
//  Simple Calculator
//
//  Created by Oncu Can on 27.08.2024.
//

import SwiftUI

@main
struct Simple_CalculatorApp: App {
    init() {
            
            UITabBar.appearance().backgroundColor = UIColor.white
            
            
            UITabBar.appearance().tintColor = UIColor.systemBlue
            
            
            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
