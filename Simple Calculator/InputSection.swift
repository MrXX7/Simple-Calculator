//
//  InputSection.swift
//  Simple Calculator
//
//  Created by Oncu Can on 17.09.2024.
//

import SwiftUI

struct InputSection: View {
    // MARK: - Properties
    @Binding var inputValue: String
    let convertUnits: () -> Void
    
    // MARK: - Constants
    private enum Constants {
        static let textFieldWidth: CGFloat = 150
        static let horizontalPadding: CGFloat = 16
        static let titleFont: Font = .title2
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            titleLabel
            Spacer()
            valueTextField
        }
        .padding()
    }
    
    // MARK: - Subviews
    private var titleLabel: some View {
        Text("Input")
            .font(Constants.titleFont)
            .padding(.leading, Constants.horizontalPadding)
    }
    
    private var valueTextField: some View {
        TextField("Enter value", text: $inputValue)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.decimalPad)
            .frame(width: Constants.textFieldWidth)
            .onChange(of: inputValue) { _ in
                convertUnits()
            }
    }
}
