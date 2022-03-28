//
//  ContentView.swift
//  TemperatureConversion
//
//  Created by 진승연 on 2022/03/28.
//

import SwiftUI

struct ContentView: View {
    @State var inputNumber: Double = 0
    @State var inputUnit: String = ""
    @State var outputUnit: String = ""
    @FocusState private var numberIsFocused: Bool
    
    let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    
    var displayNumber: Double {
        let inUnit = inputUnit
        let outUnit = outputUnit
        var number = inputNumber
        
        
        if inUnit == "Fahrenheit" {
            number = (number - 32)*(5/9)
        }
        else if inUnit == "Kelvin" {
            number = number - 273.15
        }
        
        if outUnit == "Fahrenheit" {
            return number*(9/5) + 32
        }
        else if outUnit == "Kelvin" {
            return number + 273.15
        }
        else {
            return number
        }
    }
    
    
           
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Input Unit:")
                }
                
                Section {
                    TextField("Number to be converted:", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($numberIsFocused)
                } header: {
                    Text("Number to be converted:")
                }
                    
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Output Unit:")
                }
                    
                Section {
                    Text(displayNumber.formatted())
                } header : {
                    Text("Converted Number:")
                }
            }
            .navigationTitle("Temperature Converter")
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    numberIsFocused = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
