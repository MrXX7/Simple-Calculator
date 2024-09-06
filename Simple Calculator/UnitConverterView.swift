//
//  UnitConverterView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 6.09.2024.
//

import SwiftUI

struct UnitConverterView: View {
    @State private var inputValue: String = ""
    @State private var selectedUnitFrom = 0
    @State private var selectedUnitTo = 1

    let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]

    var conversionResult: Double {
        let input = Double(inputValue) ?? 0

        // Simple conversion rates
        let conversionRates = [
            [1.0, 0.001, 3.28084, 1.09361, 0.000621371], // Meters
            [1000.0, 1.0, 3280.84, 1093.61, 0.621371],   // Kilometers
            [0.3048, 0.0003048, 1.0, 0.333333, 0.000189394], // Feet
            [0.9144, 0.0009144, 3.0, 1.0, 0.000568182], // Yards
            [1609.34, 1.60934, 5280.0, 1760.0, 1.0]     // Miles
        ]

        let rate = conversionRates[selectedUnitFrom][selectedUnitTo]
        return input * rate
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter value to convert")) {
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("From unit")) {
                    Picker("Select unit", selection: $selectedUnitFrom) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("To unit")) {
                    Picker("Select unit", selection: $selectedUnitTo) {
                        ForEach(0..<units.count) {
                            Text(self.units[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Converted value")) {
                    Text("\(conversionResult, specifier: "%.4f")")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

