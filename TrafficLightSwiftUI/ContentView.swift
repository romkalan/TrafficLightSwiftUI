//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Roman Lantsov on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var opacityForRedLight: Double = 0.3
    @State var opacityForYellowLight: Double = 0.3
    @State var opacityForGreenLight: Double = 0.3
    
    @State var buttonText = "START"
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                LightView(color: .red, opacity: opacityForRedLight)
                LightView(color: .yellow, opacity: opacityForYellowLight)
                LightView(color: .green, opacity: opacityForGreenLight)
                
                Spacer()
                                
                Button(action: changeColorLight) {
                    Text(buttonText)
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(.blue)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white,lineWidth: 4)
                        )
                }
                .padding()
            }
            .padding(.top)
            
        }
    }
    
    private func changeColorLight() {
        let turnOff: Double = 0.3
        let turnOn: Double = 1
        
        buttonText = "NEXT"
    
        if opacityForRedLight == turnOn {
            opacityForRedLight = turnOff
            opacityForGreenLight = turnOff
            opacityForYellowLight = turnOn
        } else if opacityForYellowLight == turnOn {
            opacityForRedLight = turnOff
            opacityForYellowLight = turnOff
            opacityForGreenLight = turnOn
        } else {
            opacityForYellowLight = turnOff
            opacityForGreenLight = turnOff
            opacityForRedLight = turnOn
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
