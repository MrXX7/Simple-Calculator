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

    var body: some View {
        VStack(spacing: 20) {
            Text("Conversion Tool")
                .font(.largeTitle)
                .padding()

            inputSection
            unitSelectionSection
            resultSection

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

    private var inputSection: some View {
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
    }

    private var unitSelectionSection: some View {
        HStack {
            Picker("From Unit", selection: $selectedFromUnit) {
                ForEach(units, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.horizontal)

            Text("to")

            Picker("To Unit", selection: $selectedToUnit) {
                ForEach(units, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding(.horizontal)
        }
        .padding()
    }

    private var resultSection: some View {
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






