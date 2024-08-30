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
    @State private var isSecondOperand = false

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
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
                                CalculatorButton(title: button, color: buttonColor(for: button), size: geometry.size.width / 5) {
                                    self.buttonTapped(button)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, geometry.safeAreaInsets.bottom) // Butonların en alt kısma dayanmasını engeller
            }
            .background(Color.gray.opacity(0.1))
            .ignoresSafeArea()
        }
    }

    let buttonRows: [[String]] = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"]
    ]

    private func buttonTapped(_ button: String) {
        if let _ = Double(button) {
            if isSecondOperand {
                display = button
                isSecondOperand = false
            } else {
                if display == "0" {
                    display = button
                } else {
                    display += button
                }
            }
        } else if button == "." {
            if !display.contains(".") {
                display += button
            }
        } else if button == "=" {
            calculateResult()
        } else {
            if !isSecondOperand {
                firstOperand = Double(display)
                isSecondOperand = true
            }
            currentOperation = button
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
            isSecondOperand = false
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
    var size: CGFloat
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.largeTitle)
                .frame(width: size, height: size)
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(size / 2)
                .shadow(radius: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




