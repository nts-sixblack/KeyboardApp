//
//  RainbowModifier.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 23/11/2023.
//

import Foundation
import SwiftUI

extension View {
    func rainbowAnimation() -> some View {
        self.modifier(RainbowAnimation())
    }
}

struct RainbowAnimation: ViewModifier {
    // 1
    @State var isOn: Bool = false
    
    let hueColors = stride(from: 0, to: 2, by: 0.1).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }
    // 2
    var duration: Double = 1
    var animation: Animation {
        Animation
            .linear(duration: duration)
            .repeatForever(autoreverses: false)
    }
    
    func body(content: Content) -> some View {
        let gradient = LinearGradient(gradient: Gradient(colors: hueColors+hueColors), startPoint: .topLeading, endPoint: .bottomTrailing)
        return content
            .overlay(GeometryReader { proxy in
            ZStack {
                gradient
                    .frame(width: proxy.size.width * 2)
                    .offset(x: self.isOn ? 0 : -proxy.size.width)
            }
            .allowsHitTesting(false)
        })
        .onAppear {
            withAnimation(self.animation) {
                self.isOn.toggle()
            }
        }
        .mask(content)
    }
}

#Preview {
    VStack {
        RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 10)
            .frame(width: 100, height: 100)
            .rainbowAnimation()
        
        Text("Rainbow ")
            .font(.system(size: 50))
            .rainbowAnimation()
    }

}
