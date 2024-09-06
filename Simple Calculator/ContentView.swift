//
//  ContentView.swift
//  Simple Calculator
//
//  Created by Oncu Can on 6.09.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Calculator App")
                    .font(.largeTitle)
                    .padding()
                
                // Hesap Makinesi butonu
                NavigationLink(destination: CalculatorView()) {
                    Text("Go to Calculator")
                        .font(.title)
                        .frame(width: 200, height: 50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                // Dönüştürücü butonu
                NavigationLink(destination: ConversionToolView()) {
                    Text("Go to Conversion Tool")
                        .font(.title)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationBarTitle("Main Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

