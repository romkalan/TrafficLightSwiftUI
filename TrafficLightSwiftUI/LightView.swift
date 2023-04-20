//
//  LightView.swift
//  TrafficLightSwiftUI
//
//  Created by Roman Lantsov on 20.04.2023.
//

import SwiftUI

struct LightView: View {
    let color: Color
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
    }
}

struct LightView_Previews: PreviewProvider {
    static var previews: some View {
        LightView(color: .cyan)
    }
}
