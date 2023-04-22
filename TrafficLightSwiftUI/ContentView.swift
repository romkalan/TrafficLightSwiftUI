//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Roman Lantsov on 20.04.2023.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var currentLight = CurrentLight.red
    @State private var buttonText = "START"
    @State private var opacityForRedLight = 0.3
    @State private var opacityForYellowLight = 0.3
    @State private var opacityForGreenLight = 0.3
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                LightView(color: .red, opacity: opacityForRedLight)
                    .padding(.bottom)
                LightView(color: .yellow, opacity: opacityForYellowLight)
                    .padding(.bottom)
                LightView(color: .green, opacity: opacityForGreenLight)
                
                Spacer()
                
                ButtonView(text: buttonText, action: changeColorLight)
            }
            .padding()
            
        }
    }
    
    private func changeColorLight() {
        let lightTurnOff = 0.3
        let lightTurnOn = 1.0
        
        if buttonText == "START" {
            buttonText = "NEXT"
        }
        
        switch currentLight {
        case .red:
            opacityForGreenLight = lightTurnOff
            opacityForRedLight = lightTurnOn
            currentLight = CurrentLight.yellow
        case .yellow:
            opacityForRedLight = lightTurnOff
            opacityForYellowLight = lightTurnOn
            currentLight = CurrentLight.green
        case .green:
            opacityForYellowLight = lightTurnOff
            opacityForGreenLight = lightTurnOn
            currentLight = CurrentLight.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
