//
//  ContentView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 27.08.2024.
//

import SwiftUI
import UIKit

struct CalculatorView: View {
    @State private var displayValue = "0"
    @State private var firstValue: Double? = nil
    @State private var operation: String? = nil
    @State private var inTheMiddleOfTyping = false
    
    let buttons = [
        ["AC", "+/-", "%", "/"],
        ["7", "8", "9", "*"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]
    
    // Haptic feedback generator
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    
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
                            Button(action: {
                                self.buttonTapped(button)
                            }) {
                                Text(button)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(button: button), height: self.buttonHeight())
                                    .background(self.isOperator(button) ? Color.orange : Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(self.buttonWidth(button: button) / 2)
                            }
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
    
    func buttonTapped(_ button: String) {
        feedbackGenerator.impactOccurred()
        
        switch button {
        case "0"..."9", ".":
            if inTheMiddleOfTyping {
                displayValue += button
            } else {
                displayValue = button
                inTheMiddleOfTyping = true
            }
        case "AC":
            displayValue = "0"
            firstValue = nil
            operation = nil
            inTheMiddleOfTyping = false
        case "+", "-", "*", "/":
            if let firstValue = firstValue, inTheMiddleOfTyping {
                let result = calculateResult()
                displayValue = "\(Int(result))"
                self.firstValue = result
            } else {
                firstValue = Double(displayValue)
            }
            operation = button
            inTheMiddleOfTyping = false
        case "=":
            if let _ = firstValue, let operation = operation {
                let result = calculateResult()
                displayValue = "\(Int(result))"
                self.firstValue = nil
                self.operation = nil
                inTheMiddleOfTyping = false
            }
        default:
            break
        }
    }
    
    func isOperator(_ button: String) -> Bool {
        return button == "/" || button == "*" || button == "-" || button == "+" || button == "=" || button == "AC" || button == "+/-" || button == "%"
    }
    func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.black
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.orange]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.orange]
        UITabBar.appearance().standardAppearance = appearance
    }

    
    func buttonWidth(button: String) -> CGFloat {
        if button == "0" {
            return (UIScreen.main.bounds.width - 4 * 15) / 2
        }
        return (UIScreen.main.bounds.width - 5 * 15) / 4
    }
    
    func buttonHeight() -> CGFloat {
        return (UIScreen.main.bounds.width - 5 * 15) / 4
    }    
    func calculateResult() -> Double {
        let secondValue = Double(displayValue) ?? 0.0
        var result: Double = 0.0
        
        if let firstValue = firstValue {
            switch operation {
            case "+":
                result = firstValue + secondValue
            case "-":
                result = firstValue - secondValue
            case "*":
                result = firstValue * secondValue
            case "/":
                result = firstValue / secondValue
            default:
                break
            } 
        }
        return result
    }
    
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}











