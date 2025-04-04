//
//  ResultSection.swift
//  Simple Calculator
//
//  Created by Oncu Can on 19.09.2024.
//

import SwiftUI

struct ResultSection: View {
    // MARK: - Properties
    @Binding var convertedValue: String
    @Binding var showConvertedValue: Bool
    
    // MARK: - Constants
    private enum Constants {
        static let horizontalPadding: CGFloat = 16
        static let titleFont: Font = .title2
        static let valueFont: Font = .title
        static let placeholderText = "Result"
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            titleLabel
            Spacer()
            convertedValueView
        }
        .padding()
    }
    
    // MARK: - Subviews
    private var titleLabel: some View {
        Text("Converted")
            .font(Constants.titleFont)
            .padding(.leading, Constants.horizontalPadding)
    }
    
    private var convertedValueView: some View {
        Group {
            if showConvertedValue {
                Text(convertedValue.isEmpty ? Constants.placeholderText : convertedValue)
                    .font(Constants.valueFont)
                    .padding(.trailing, Constants.horizontalPadding)
                    .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showConvertedValue)
    }
}

