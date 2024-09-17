//
//  PresetValuePicker.swift
//  Simple Calculator
//
//  Created by Oncu Can on 17.09.2024.
//

import SwiftUI

struct PresetValuePicker: View {
    let presetValues: [String]
    @Binding var selectedPresetValue: String
    @Binding var inputValue: String // Binding to update inputValue
    let convertUnits: () -> Void // A function passed from the parent

    var body: some View {
        Picker("Preset Values", selection: $selectedPresetValue) {
            ForEach(presetValues, id: \.self) { value in
                Text(value)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .onChange(of: selectedPresetValue) { newValue in
            inputValue = newValue // Update inputValue from selected preset
            convertUnits() // Call the conversion function after changing
        }
    }
}

