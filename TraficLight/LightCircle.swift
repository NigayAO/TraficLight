//
//  LightCircle.swift
//  TraficLight
//
//  Created by Alik Nigay on 20.01.2022.
//

import SwiftUI

struct LightCircle: View {
    private let height = UIScreen.main.bounds.height
    private let width = UIScreen.main.bounds.width
    let color: Color
    var body: some View {
        Circle()
            .frame(width: width / 3, height: height / 6)
            .foregroundColor(color)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 10)
            .padding(.bottom, 10)
    }
}

struct LightCircle_Previews: PreviewProvider {
    static var previews: some View {
        LightCircle(color: .green)
    }
}
