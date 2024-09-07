//
//  MainView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 7.09.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CalculatorView()
                .tabItem {
                    Label("Calculator", systemImage: "plus.slash.minus")
                }
            
            ConversionToolView()
                .tabItem {
                    Label("Conversion", systemImage: "arrow.left.arrow.right")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

