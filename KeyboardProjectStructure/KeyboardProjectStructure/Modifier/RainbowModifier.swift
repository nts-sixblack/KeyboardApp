//
//  RainbowModifier.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 23/11/2023.
//

import Foundation
import SwiftUI

extension View {
    func rainbowAnimation(_ theme: Theme) -> some View {
        self.modifier(RainbowAnimation(theme: theme))
    }
}

struct RainbowAnimation: ViewModifier {
    
    var theme: Theme
    
    @State var isOn: Bool = false
    let hueColors = stride(from: 0, to: 1, by: 0.1).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }
    var animation: Animation {
        Animation
            .linear(duration: theme.durationAnimation)
            .repeatForever(autoreverses: false)
    }

    func body(content: Content) -> some View {
        
        let gradient = LinearGradient(gradient: Gradient(colors: hueColors+hueColors), startPoint: .leading, endPoint: .trailing)
        
        return content
            .overlay(GeometryReader { proxy in
                if let buttonNeonAnimation = theme.buttonNeonAnimation {
                    AnimatedGradient(animationDuration: theme.durationAnimation, animationValues: buttonNeonAnimation)
                        .allowsHitTesting(false)
                }
                if theme.neonLinearAnimation == .LTR {
                    gradient
                        .frame(width: proxy.size.width * 2)
                        .offset(x: self.isOn ? 0 : -proxy.size.width)
                } else if theme.neonLinearAnimation == .RTL {
                    gradient
                        .frame(width: proxy.size.width * 2)
                        .offset(x: self.isOn ? -proxy.size.width : 0 )
                }
        })

        .mask(content)
        .onAppear {
            withAnimation(self.animation) {
                self.isOn = true
            }
        }
    }
}

#Preview {
    VStack {
        RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 10)
            .frame(width: 100, height: 100)
            .rainbowAnimation(.standard)
        
        Text("Rainbow ")
            .font(.system(size: 50))
            .rainbowAnimation(.standard)
    }

}
