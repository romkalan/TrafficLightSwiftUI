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
    @State var currentLight = CurrentLight.red
    @State var buttonText = "START"
    @State var opacityForRedLight: Double = 0.3
    @State var opacityForYellowLight: Double = 0.3
    @State var opacityForGreenLight: Double = 0.3
    
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
            }
            .padding()
            
        }
    }
    
    private func changeColorLight() {
        let lightTurnOff: Double = 0.3
        let lightTurnOn: Double = 1
        
        buttonText = "NEXT"
        
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
