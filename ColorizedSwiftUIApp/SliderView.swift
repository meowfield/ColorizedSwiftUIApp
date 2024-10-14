//
//  SliderView.swift
//  ColorizedSwiftUIApp
//
//  Created by Данис Гаязов on 14.10.24..
//

import SwiftUI

struct SliderView: View {
    @Binding var colorValue: Double
    @FocusState.Binding var fieldFocus: FocusField?
    @State private var tempValue: String = ""
    
    let field: FocusField
    
    var body: some View {
        HStack {
            Text(String(format: "%.0f", colorValue))
                .frame(width: 40, alignment: .leading)
            Slider(value: $colorValue, in: 0...255, step: 1)
                .animation(.easeInOut(duration: 0.3), value: colorValue)
                .onChange(of: colorValue) { oldValue, newValue in
                    tempValue = String(format: "%.0f", newValue)
                }
            TextField("", text: $tempValue)
                .frame(width: 50)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .focused($fieldFocus, equals: field)
                .onAppear {
                    tempValue = String(format: "%.0f", colorValue)
                }
                .onSubmit {
                    commitChanges()
                }
                .onChange(of: fieldFocus) { oldFocus, newFocus in
                    if newFocus != field {
                        commitChanges()
                    }
                }
        }
        .padding()
    }
    
    private func commitChanges() {
        if let newValue = Double(tempValue), newValue >= 0, newValue <= 255 {
            colorValue = newValue
        } else {
            tempValue = String(format: "%.0f", colorValue)
        }
    }
}
