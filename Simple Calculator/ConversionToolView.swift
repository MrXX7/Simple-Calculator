//
//  ConversionToolView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 6.09.2024.
//

import SwiftUI

struct ConversionToolView: View {
    @State private var inputValue: String = ""
    @State private var selectedUnitFrom: String = "Meters"
    @State private var selectedUnitTo: String = "Kilometers"
    @State private var convertedValue: String = ""
    
    let units = ["Meters", "Kilometers", "Miles", "Yards"]
    
    var body: some View {
        VStack {
            Text("Conversion Tool")
                .font(.largeTitle)
                .padding()
            
            // Input alanı
            HStack {
                Text("Input")
                    .font(.title2)
                Spacer()
                TextField("Enter value", text: $inputValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding()
            }
            .padding()

            // Birim seçim araçları
            HStack {
                Picker("From", selection: $selectedUnitFrom) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                
                Text("to")
                
                Picker("To", selection: $selectedUnitTo) {
                    ForEach(units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .padding()

            // Dönüşüm sonucu
            HStack {
                Text("Converted")
                    .font(.title2)
                Spacer()
                Text(convertedValue.isEmpty ? "Result" : convertedValue)
                    .font(.title)
                    .padding()
            }
            .padding()
            
            // Dönüştürme butonu
            Button(action: {
                convert()
            }) {
                Text("Convert")
                    .font(.title2)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .padding()
        .navigationBarTitle("Conversion Tool", displayMode: .inline)
    }
    
    // Basit dönüşüm fonksiyonu (örnek)
    func convert() {
        guard let input = Double(inputValue) else {
            convertedValue = "Invalid input"
            return
        }
        
        // Basit örnek dönüşüm (birimlerin oranlarını ayarlayın)
        var result = input
        if selectedUnitFrom == "Meters" && selectedUnitTo == "Kilometers" {
            result = input / 1000
        } else if selectedUnitFrom == "Kilometers" && selectedUnitTo == "Meters" {
            result = input * 1000
        }
        // Ek dönüşümler eklenebilir
        
        convertedValue = String(format: "%.2f", result)
    }
}

struct ConversionToolView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionToolView()
    }
}


