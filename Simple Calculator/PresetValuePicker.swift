//
//  PresetValuePicker.swift
//  Simple Calculator
//
//  Created by Oncu Can on 17.09.2024.
//

import SwiftUI

struct PresetValuePicker: View {
    // MARK: - Properties
    let presetValues: [String]
    @Binding var selectedPresetValue: String
    @Binding var inputValue: String
    let convertUnits: () -> Void
    
    // MARK: - Constants
    private enum Constants {
        static let pickerPadding: CGFloat = 16
        static let pickerLabel = "Preset Values"
    }
    
    // MARK: - Body
    var body: some View {
        Picker(Constants.pickerLabel, selection: $selectedPresetValue) {
            ForEach(presetValues, id: \.self) {
                Text($0)
            }
        }
        .pickerStyle(.segmented)
        .padding(Constants.pickerPadding)
        .onChange(of: selectedPresetValue) { newValue in
            handlePresetSelection(newValue)
        }
    }
    
    // MARK: - Private Methods
    private func handlePresetSelection(_ newValue: String) {
        inputValue = newValue
        convertUnits()
    }
}

