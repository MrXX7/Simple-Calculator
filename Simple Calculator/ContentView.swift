//
//  ContentView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 27.08.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var currentOperation: String? = nil
    @State private var firstOperand: Double? = nil
    @State private var isShowingResult = false

    var body: some View {
        VStack {
            Spacer()

            Text(display)
                .font(.system(size: 70))
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .background(Color.black)
                .cornerRadius(10)
                .padding(.horizontal)

            Spacer()

            VStack(spacing: 10) {
                ForEach(buttonRows, id: \.self) { row in
                    HStack(spacing: 10) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButton(title: button, color: buttonColor(for: button)) {
                                self.buttonTapped(button)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .background(Color.gray.opacity(0.1))
        .ignoresSafeArea()
    }

    let buttonRows: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"]
    ]

    private func buttonTapped(_ button: String) {
        if isShowingResult {
            display = "0"
            isShowingResult = false
        }

        if let _ = Double(button) {
            if display == "0" || isShowingResult {
                display = button
            } else {
                display += button
            }
        } else if button == "." {
            if !display.contains(".") {
                display += button
            }
        } else if button == "=" {
            calculateResult()
            isShowingResult = true
        } else {
            currentOperation = button
            firstOperand = Double(display)
            display = "0"
        }
    }

    private func calculateResult() {
        if let operation = currentOperation, let firstOperand = firstOperand, let secondOperand = Double(display) {
            let result: Double?

            switch operation {
            case "+":
                result = firstOperand + secondOperand
            case "-":
                result = firstOperand - secondOperand
            case "*":
                result = firstOperand * secondOperand
            case "/":
                result = secondOperand != 0 ? firstOperand / secondOperand : nil
            default:
                result = nil
            }

            if let result = result {
                display = String(result)
            } else {
                display = "Error"
            }

            currentOperation = nil
            self.firstOperand = nil
        }
    }

    private func buttonColor(for title: String) -> Color {
        if let _ = Double(title) {
            return Color(.systemGray)
        } else if title == "=" {
            return Color.orange
        } else {
            return Color(.systemOrange)
        }
    }
}

struct CalculatorButton: View {
    var title: String
    var color: Color
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.largeTitle)
                .frame(width: 80, height: 80)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(40)
                .shadow(radius: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

