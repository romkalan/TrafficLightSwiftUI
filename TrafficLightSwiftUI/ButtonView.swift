//
//  ButtonView.swift
//  TrafficLightSwiftUI
//
//  Created by Roman Lantsov on 22.04.2023.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
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
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "START", action: {})
    }
}
