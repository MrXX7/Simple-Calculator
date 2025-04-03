//
//  UnitConverterView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 6.09.2024.
//

import SwiftUI

struct UnitConverterView: View {
    // MARK: - State & Constants
    @State private var inputValue: String = ""
    @State private var selectedUnitFrom = 0
    @State private var selectedUnitTo = 1
    
    private let units = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    // Conversion matrix (from row → to column)
    private let conversionRates: [[Double]] = [
        [1.0, 0.001, 3.28084, 1.09361, 0.000621371],    // Meters → [Meters, Kilometers, Feet, Yards, Miles]
        [1000.0, 1.0, 3280.84, 1093.61, 0.621371],       // Kilometers → [...]
        [0.3048, 0.0003048, 1.0, 0.333333, 0.000189394], // Feet → [...]
        [0.9144, 0.0009144, 3.0, 1.0, 0.000568182],     // Yards → [...]
        [1609.34, 1.60934, 5280.0, 1760.0, 1.0]         // Miles → [...]
    ]
    
    // MARK: - Computed Properties
    private var conversionResult: Double {
        let input = Double(inputValue) ?? 0
        let rate = conversionRates[selectedUnitFrom][selectedUnitTo]
        return input * rate
    }
    
    // MARK: - UI
    var body: some View {
        NavigationView {
            Form {
                valueInputSection
                unitSelectionSections
                resultSection
            }
            .navigationTitle("Unit Converter")
        }
    }
    
    // MARK: - Subviews
    private var valueInputSection: some View {
        Section(header: Text("Enter value to convert")) {
            TextField("Value", text: $inputValue)
                .keyboardType(.decimalPad)
        }
    }
    
    private var unitSelectionSections: some View {
        Group {
            Section(header: Text("From unit")) {
                unitPicker(selection: $selectedUnitFrom)
            }
            
            Section(header: Text("To unit")) {
                unitPicker(selection: $selectedUnitTo)
            }
        }
    }
    
    private var resultSection: some View {
        Section(header: Text("Converted value")) {
            Text("\(conversionResult, specifier: "%.4f")")
        }
    }
    
    // MARK: - Helper Views
    private func unitPicker(selection: Binding<Int>) -> some View {
        Picker("Select unit", selection: selection) {
            ForEach(units.indices, id: \.self) { index in
                Text(units[index])
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

