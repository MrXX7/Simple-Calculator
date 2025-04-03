//
//  CalculatorView 2.swift
//  Simple Calculator
//
//  Created by Oncu Can on 1.12.2024.
//


import SwiftUI

struct CalculatorView: View {
    @State private var displayValue = "0"
    @State private var firstValue: Double? = nil
    @State private var operation: String? = nil
    @State private var inTheMiddleOfTyping = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(displayValue)
                .font(.system(size: 64))
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
            
            Spacer().frame(height: 10)  // Sonuç ekranı ile butonlar arasındaki boşluğu azalt
            
            VStack(spacing: 15) {
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 15) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButton(button: button, displayValue: $displayValue, firstValue: $firstValue, operation: $operation, inTheMiddleOfTyping: $inTheMiddleOfTyping)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .onAppear {
            setupTabBarAppearance()
        }
    }
    
    func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.black
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.orange]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.orange]
        UITabBar.appearance().standardAppearance = appearance
    }
}
