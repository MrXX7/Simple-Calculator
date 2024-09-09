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
    
    let units = ["m", "km", "mi", "cm"]
    let unitNames = ["Meters": "m", "Kilometers": "km", "Miles": "mi", "Centimeters": "cm"]
    let presetValues = ["1", "10", "25", "50", "100", "250", "500", "1000"]

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
                            .font(.body)
                            .padding(8)
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

            // From Unit Selection
            HStack {
                ForEach(units, id: \.self) { unit in
                    Button(action: {
                        selectedFromUnit = unit
                        convertUnits()
                    }) {
                        Text(unitNames.first { $0.value == unit }?.key ?? "")
                            .font(.body)
                            .padding(8)
                            .background(selectedFromUnit == unit ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedFromUnit == unit ? .white : .black)
                            .cornerRadius(8)
                    }
                }
            }
            .padding()

            // To Unit Selection
            HStack{
                ForEach(units, id: \.self) { unit in
                    Button(action: {
                        selectedToUnit = unit
                        convertUnits()
                    }) {
                        Text(units.first { $0.value == unit }?.key ?? "")
                            .font(.body)
                            .padding(8)
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









