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
    
    let units = ["m", "km", "mi", "cm"]
    let unitNames = ["Meters": "m", "Kilometers": "km", "Miles": "mi", "Centimeters": "cm"]
    let presetValues = ["1", "10", "25", "50", "100", "250", "500", "1000"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Conversion Tool")
                .font(.largeTitle)
                .padding()

            // Preset Values
            Picker("Preset Values", selection: $selectedPresetValue) {
                ForEach(presetValues, id: \.self) { value in
                    Text(value)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: selectedPresetValue) { newValue in
                inputValue = newValue
                convertUnits()
            }

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
                    .onChange(of: inputValue) { _ in
                        convertUnits()
                    }
            }
            .padding()

            // From Unit Selection
            Picker("From Unit", selection: $selectedFromUnit) {
                ForEach(units, id: \.self) { unit in
                    Text(unitNames.first { $0.value == unit }?.key ?? "")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: selectedFromUnit) { _ in
                convertUnits()
            }

            // To Unit Selection
            Picker("To Unit", selection: $selectedToUnit) {
                ForEach(units, id: \.self) { unit in
                    Text(unitNames.first { $0.value == unit }?.key ?? "")
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            .onChange(of: selectedToUnit) { _ in
                convertUnits()
            }

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
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.white

            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
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

        convertedValue = String(format: "%.3f", result)
    }
}

struct ConversionToolView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionToolView()
    }
}











