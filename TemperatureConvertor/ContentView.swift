//
//  ContentView.swift
//  TemperatureConvertor
//
//  Created by Raszion23 on 12/23/21.
//

import SwiftUI

struct ContentView: View {
    @State var tempInput = ""
    let tempType = ["Fahrenheit", "Celsius", "Kelvin"]
    @State private var selectedType = 0
    @State private var conversionResults = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Degrees")
                        TextField("", text: $tempInput)
                            .keyboardType(.numberPad)

                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.gray)
                            .padding(.top, 7)
                    }

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
                        Rectangle()
                            .frame(height: 1.0, alignment: .bottom)
                            .foregroundColor(.gray)
                    }
                }
                .padding()

                VStack(alignment: .leading) {
                    Text("Results:")
                    Text(conversionResults)
                    
                    Rectangle()
                        .frame(height: 1.0, alignment: .bottom)
                        .foregroundColor(.gray)
                }.padding()

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
            .navigationTitle("Temperature Convertor")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    func conversion(input: Double) {
        if selectedType == 0 {
            conversionResults = fromFarenheit(input: input)
        }
        
    }
    
    func fromFarenheit(input: Double) -> String {
        let toC = (input - 32) * 0.5556
        let toK = (input - 32) * 9 / 5 + 273.15
        
        return "Celcius: \(toC) \nKelvin: \(toK)"
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
