//
//  ConversionToolView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 6.09.2024.
//

import SwiftUI

struct ConversionToolView: View {
    @State private var inputValue: String = ""
    @State private var convertedValue: String = ""
    @State private var selectedFromUnit: String = "Meters"
    @State private var selectedToUnit: String = "Kilometers"
    
    let units = ["Meters", "Kilometers", "Miles", "Centimeters"]
    let presetValues = ["1", "225", "50", "100", "1000"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Conversion Tool")
                .font(.largeTitle)
                .padding()
            
            // Preset Values
            HStack {
                ForEach(presetValues, id: \.self) { value in
                    Button(action: {
                        inputValue = value
                        convertUnits()
                    }) {
                        Text(value)
                            .font(.title2)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            .padding()

            // Input Section
            HStack {
                Text("Input")
                    .font(.title2)
                    .padding(.leading)
                Spacer()
                TextField("Enter value", text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .frame(width: 150)
            }
            .padding()

            // Unit Selection
            HStack {
                ForEach(units, id: \.self) { unit in
                    Button(action: {
                        selectedFromUnit = unit
                        convertUnits()
                    }) {
                        Text(unit)
                            .padding()
                            .background(selectedFromUnit == unit ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedFromUnit == unit ? .white : .black)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()

            HStack {
                Text("to")
                    .font(.title2)
                    .padding(.horizontal)

                ForEach(units, id: \.self) { unit in
                    Button(action: {
                        selectedToUnit = unit
                        convertUnits()
                    }) {
                        Text(unit)
                            .padding()
                            .background(selectedToUnit == unit ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedToUnit == unit ? .white : .black)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()

            // Result Section
            HStack {
                Text("Converted")
                    .font(.title2)
                    .padding(.leading)
                Spacer()
                Text(convertedValue.isEmpty ? "Result" : convertedValue)
                    .font(.title)
                    .padding(.trailing)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationBarTitle("Conversion Tool", displayMode: .inline)
        .onChange(of: inputValue) { _ in
            convertUnits()
        }
        .onChange(of: selectedFromUnit) { _ in
            convertUnits()
        }
        .onChange(of: selectedToUnit) { _ in
            convertUnits()
        }
    }

    private func convertUnits() {
        guard let value = Double(inputValue) else {
            convertedValue = "Invalid input"
            return
        }

        let result: Double
        switch (selectedFromUnit, selectedToUnit) {
        case ("Meters", "Kilometers"):
            result = value / 1000
        case ("Kilometers", "Meters"):
            result = value * 1000
        case ("Miles", "Kilometers"):
            result = value * 1.60934
        case ("Kilometers", "Miles"):
            result = value / 1.60934
        case ("Meters", "Miles"):
            result = value / 1609.34
        case ("Miles", "Meters"):
            result = value * 1609.34
        default:
            result = value
        }

        convertedValue = String(format: "%.3f", result)
    }
}

struct ConversionToolView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionToolView()
    }
}







