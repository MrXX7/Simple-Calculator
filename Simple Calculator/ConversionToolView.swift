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
    @State private var selectedFromUnit: String = "m"
    @State private var selectedToUnit: String = "km"
    @State private var selectedPresetValue: String = "1"
    @State private var showConvertedValue = false

    let units = ["m", "km", "mi", "cm"]
    let unitNames = ["Meters": "m", "Kilometers": "km", "Miles": "mi", "Centimeters": "cm"]
    let presetValues = ["1", "10", "25", "50", "100", "250", "500", "1000"]


    var body: some View {
        VStack(spacing: 20) {
            Text("Conversion Tool")
                .font(.largeTitle)
                .padding()
            
            
            // Preset Values
            PresetValuePicker(presetValues: presetValues,
                              selectedPresetValue: $selectedPresetValue,
                              inputValue: $inputValue, // Pass inputValue as a binding
                              convertUnits: convertUnits) //
            
            // Input Section
            InputSection(inputValue: $inputValue, convertUnits: convertUnits)
            
            ResetButton(action: reset)
            
            UnitPicker(
                title: "From Unit",
                selectedUnit: $selectedFromUnit,
                units: units,
                unitNames: unitNames,
                convertUnits: convertUnits // Pass convertUnits as a closure
            )
            
            // To Unit Selection
            UnitPicker(
                title: "To Unit",
                selectedUnit: $selectedToUnit,
                units: units,
                unitNames: unitNames,
                convertUnits: convertUnits // Pass convertUnits as a closure
            )
            // Result Section
            ResultSection(convertedValue: $convertedValue, showConvertedValue: $showConvertedValue)
            
            Spacer()
        }
        .padding()
        .navigationBarTitle("Conversion Tool", displayMode: .inline)
        .onAppear {
            setupConversionTabBarAppearance()
        }
    }
    
    private func convertUnits() {
        guard let value = Double(inputValue) else {
            convertedValue = "Invalid input"
            return
        }

        let result: Double
        switch (selectedFromUnit, selectedToUnit) {
        case ("m", "km"):
            result = value / 1000
        case ("km", "m"):
            result = value * 1000
        case ("mi", "km"):
            result = value * 1.60934
        case ("km", "mi"):
            result = value / 1.60934
        case ("m", "mi"):
            result = value / 1609.34
        case ("mi", "m"):
            result = value * 1609.34
        default:
            result = value
        }

        withAnimation { // Dönüşüm sonucu animasyonla görünür
            convertedValue = String(format: "%.3f", result)
            showConvertedValue = true
        }
    }
    
    private func reset() {
        inputValue = ""
        convertedValue = ""
        selectedFromUnit = "m"
        selectedToUnit = "km"
        selectedPresetValue = "1"
        showConvertedValue = false // Sonuçları gizle
    }
    
    func setupConversionTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.white
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.orange]
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.orange]
        UITabBar.appearance().standardAppearance = appearance
    }
}

struct ConversionToolView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionToolView()
    }
}














