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
                    Image(systemName: "plus.slash.minus")
                    Text("Calculator")
                }
            
            ConversionToolView()
                .tabItem {
                    Image(systemName: "arrow.left.arrow.right")
                    Text("Conversion")
                }
        }
        .accentColor(.orange) // Aktif sekme turuncu
        .background(Color.black.edgesIgnoringSafeArea(.all)) // Arka planı siyah yap
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

