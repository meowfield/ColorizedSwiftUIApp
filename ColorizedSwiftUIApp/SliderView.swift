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
    let field: FocusField
    
    var body: some View {
        HStack {
            Text(String(format: "%.0f", colorValue))
            Slider(value: $colorValue, in: 0...255, step: 1)
            TextField("", value: $colorValue, format: .number)
                .frame(width: 50)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .focused($fieldFocus, equals: field)
        }
        .padding()
        
    }
}

