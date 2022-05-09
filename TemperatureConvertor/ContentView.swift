//
//  ContentView.swift
//  TemperatureConvertor
//
//  Created by Raszion23 on 12/23/21.
//

import SwiftUI

struct ContentView: View {
    // Variable for user to input temp
    @State var tempInput = ""
    // Represents the temperature type position in the tempType array
    @State private var selectedType = 0
    // Holds the temperature conversion results
    @State private var conversionResults = ""
    // Array of temperature types
    let tempType = ["Fahrenheit", "Celsius", "Kelvin"]

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // TextField for user to input degrees to convert
                    VStack(alignment: .leading) {
                        Text("Degrees")
                        TextField("", text: $tempInput)
                            .keyboardType(.numberPad)

                        // Create the under line
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.gray)
                            .padding(.top, 7)
                    }

                    // Picker so user can select the temperature type converting from
                    VStack(alignment: .leading) {
                        Text("Type")
                        VStack {
                            Picker("", selection: $selectedType) {
                                ForEach(0 ..< 3) {
                                    Text(tempType[$0])
                                        .font(.title)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        // Create the under line
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.gray)
                    }
                }
                .padding()

                // Display the results from the temperature conversions
                VStack(alignment: .leading) {
                    Text("Results")
                    Text(conversionResults)

                    // Create the under line
                    Rectangle()
                        .frame(height: 1.0, alignment: .bottom)
                        .foregroundColor(.gray)
                }.padding()

                // Buttont o call the converion() function
                Button {
                    conversion(input: Double(tempInput) ?? 0.0)
                } label: {
                    Text("Convert")
                        .font(.title)
                        .bold()
                }
                .padding()
                .foregroundColor(.white)
                .frame(width: 350)
                .background(Color.blue)
                .clipShape(Capsule())
                .padding()

                Spacer()
            }
            // Navigation title
            .navigationTitle("Temperature Convertor")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    // Call the different conversion formulas
    func conversion(input: Double) {
        if selectedType == 0 {
            conversionResults = fromFarenheit(input: input)

        } else if selectedType == 1 {
            conversionResults = fromCelcius(input: input)

        } else if selectedType == 2 {
            conversionResults = fromKelvin(input: input)
        }
    }

    // Convert from Farenheint
    func fromFarenheit(input: Double) -> String {
        let toC = (input - 32) * 0.5556
        let toK = (input - 32) * 9 / 5 + 273.15

        return "Celcius: \(toC) \nKelvin: \(toK)"
    }

    // Convert from Celcius
    func fromCelcius(input: Double) -> String {
        let toF = (input * 1.8) + 32
        let toK = input + 273.15

        return "Fahrenheit: \(toF) \nKelvin: \(toK)"
    }

    // Convert from Kelvin
    func fromKelvin(input: Double) -> String {
        let toF = 1.8 * (input - 273.15) + 32
        let toC = input - 273.15

        return "Fahrenheit: \(toF) \nCelcius: \(toC)"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
