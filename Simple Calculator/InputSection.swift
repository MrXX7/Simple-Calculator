//
//  InputSection.swift
//  Simple Calculator
//
//  Created by Oncu Can on 17.09.2024.
//

import SwiftUI

struct InputSection: View {
    @Binding var inputValue: String
    let convertUnits: () -> Void
    
    var body: some View {
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
    }
}
