//
//  ContentView.swift
//  TrafficLightSwiftUI
//
//  Created by Roman Lantsov on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                LightView(color: .red)
                LightView(color: .yellow)
                LightView(color: .green)
                Spacer()
            }
            .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
