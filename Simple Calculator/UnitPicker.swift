//
//  UnitPicker.swift
//  Simple Calculator
//
//  Created by Oncu Can on 18.09.2024.
//

import SwiftUI

struct UnitPicker: View {
    let title: String
    @Binding var selectedUnit: String
    let units: [String]
    let unitNames: [String: String]
    let convertUnits: () -> Void // Accept the conversion function closure

    var body: some View {
        Picker(title, selection: $selectedUnit) {
            ForEach(units, id: \.self) { unit in
                Text(unitNames.first { $0.value == unit }?.key ?? "")
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
        .onChange(of: selectedUnit) { _ in
            convertUnits() // Call the conversion function when the unit changes
        }
    }
}


