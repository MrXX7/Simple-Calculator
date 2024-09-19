//
//  ResultSection.swift
//  Simple Calculator
//
//  Created by Oncu Can on 19.09.2024.
//

import SwiftUI

struct ResultSection: View {
    @Binding var convertedValue: String
    @Binding var showConvertedValue: Bool
    
    var body: some View {
        HStack {
            Text("Converted")
                .font(.title2)
                .padding(.leading)
            Spacer()
            if showConvertedValue {
                Text(convertedValue.isEmpty ? "Result" : convertedValue)
                    .font(.title)
                    .padding(.trailing)
                    .transition(.scale)
            }
        }
        .padding()
    }
}

