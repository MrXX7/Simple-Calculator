//
//  ResetButton.swift
//  Simple Calculator
//
//  Created by Oncu Can on 17.09.2024.
//

import SwiftUI

struct ResetButton: View {
    private enum Constants {
        static let iconSize: CGFloat = 12
        static let iconPadding: CGFloat = 8
        static let topPadding: CGFloat = -30
        static let trailingPadding: CGFloat = 20
    }
    
    let action: () -> Void
    private let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    
    var body: some View {
        Button(action: performAction) {
            Image(systemName: "arrow.uturn.left")
                .resizable()
                .scaledToFit()
                .frame(width: Constants.iconSize, height: Constants.iconSize)
                .foregroundColor(.blue)
                .padding(Constants.iconPadding)
                .accessibilityLabel("Reset")
        }
        .padding(.top, Constants.topPadding)
        .padding(.trailing, Constants.trailingPadding)
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private func performAction() {
        withAnimation(.easeInOut(duration: 0.2)) {
            action()
            feedbackGenerator.impactOccurred()
        }
    }
}

