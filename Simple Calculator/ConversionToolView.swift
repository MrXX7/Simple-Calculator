//
//  ConversionToolView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 6.09.2024.
//

import SwiftUI

struct ConversionToolView: View {
    var body: some View {
        VStack {
            Text("Conversion Tool")
                .font(.largeTitle)
                .padding()
            
            // Dönüştürme aracı bileşenlerini buraya ekleyin
            // Örneğin, birim dönüştürücü
            HStack {
                Text("Input")
                    .font(.title2)
                Spacer()
                TextField("Enter value", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()
            }
            .padding()

            HStack {
                Text("Converted")
                    .font(.title2)
                Spacer()
                Text("Result")
                    .font(.title)
                    .padding()
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationBarTitle("Conversion Tool", displayMode: .inline)
    }
}

struct ConversionToolView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionToolView()
    }
}

