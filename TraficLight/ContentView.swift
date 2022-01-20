//
//  ContentView.swift
//  TraficLight
//
//  Created by Alik Nigay on 20.01.2022.
//

import SwiftUI

enum TrafficColor {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var title = "START"
    @State private var redOpacity = 0.3
    @State private var yellowOpacity = 0.3
    @State private var greenOpacity = 0.3
    private let isOn = 1.0
    private let isOff = 0.3
    @State private var currentColor = TrafficColor.red
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                LightCircle(color: .red)
                    .opacity(redOpacity)
                LightCircle(color: .yellow)
                    .opacity(yellowOpacity)
                LightCircle(color: .green)
                    .opacity(greenOpacity)
                Spacer()
                Button {
                    title = "NEXT"
                    switch currentColor {
                    case .red:
                        redOpacity = isOn
                        greenOpacity = isOff
                        currentColor = .yellow
                    case .yellow:
                        yellowOpacity = isOn
                        redOpacity = isOff
                        currentColor = .green
                    case .green:
                        greenOpacity = isOn
                        yellowOpacity = isOff
                        currentColor = .red
                    }
                } label: {
                    setButtonLabel
                }
                .padding()
            }
        }
    }
    
    private var setButtonLabel: some View {
        ZStack {
            SetupButton()
            Text(title)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
    }
}

struct SetupButton: View {
    private let width = UIScreen.main.bounds.width / 2
    private let height = UIScreen.main.bounds.height / 12
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.blue)
            .frame(width: width, height: height)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
