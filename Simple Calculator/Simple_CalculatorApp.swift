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
        UITabBar.appearance().barTintColor = UIColor.black  // Arka plan rengini siyah yapar
                UITabBar.appearance().backgroundColor = UIColor.black
                UITabBar.appearance().tintColor = UIColor.orange  // Seçili sekme rengi
                UITabBar.appearance().unselectedItemTintColor = UIColor.gray 
        }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
