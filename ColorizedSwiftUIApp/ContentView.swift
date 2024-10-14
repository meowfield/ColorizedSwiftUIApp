//
//  ContentView.swift
//  ColorizedSwiftUIApp
//
//  Created by Данис Гаязов on 10.10.24..
//

import SwiftUI

struct ContentView: View {
    
    @State private var redValue: Double = 240
    @State private var greenValue: Double = 133
    @State private var blueValue: Double = 180
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .foregroundColor(mixColors(redValue, greenValue, blueValue))
                .frame(height: 150)
                .cornerRadius(15)
                .shadow(radius: 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 1)
                )
                .padding()
            
            VStack(spacing: -10) {
                SliderView(colorValue: $redValue, fieldFocus: $focusedField, field: .red)
                SliderView(colorValue: $greenValue, fieldFocus: $focusedField, field: .green)
                SliderView(colorValue: $blueValue, fieldFocus: $focusedField, field: .blue)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(red: 0.2, green: 0.4, blue: 1, opacity: 0.4))
        .onTapGesture {
            focusedField = nil
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    focusedField = nil
                }
            }
        }
    }
}

enum FocusField: Hashable {
    case red, green, blue
}

func mixColors(_ red: Double, _ green: Double, _ blue: Double) -> Color {
    return Color(red: red/255, green: green/255, blue: blue/255, opacity: 1)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
