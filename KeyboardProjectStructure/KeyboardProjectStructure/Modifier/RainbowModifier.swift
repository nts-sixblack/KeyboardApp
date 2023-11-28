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
    let sharedDefault = UserDefaults(suiteName: "group.com.maxmobile.NeonLedKeyboard")!

    func body(content: Content) -> some View {
        return content
            .overlay(GeometryReader { proxy in
                if let buttonNeonAnimation = theme.buttonNeonAnimation {
                    AnimatedGradient(animationValues: buttonNeonAnimation)
                        .allowsHitTesting(false)
                }
                
        })

        .mask(content)
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
