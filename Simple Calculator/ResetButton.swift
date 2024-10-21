//
//  ResetButton.swift
//  Simple Calculator
//
//  Created by Oncu Can on 17.09.2024.
//

import SwiftUI

struct ResetButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            withAnimation { // Sıfırlama animasyonu
                action()
                let generator = UIImpactFeedbackGenerator(style: .light)
                generator.impactOccurred()
            }
        }) {
            Image(systemName: "arrow.uturn.left")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .foregroundColor(.blue)
                .padding()
        }
        .padding(.top, -30)
        .padding(.trailing, 20)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

