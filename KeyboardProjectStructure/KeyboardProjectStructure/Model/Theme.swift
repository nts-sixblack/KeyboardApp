//
//  Theme.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 23/11/2023.
//

import Foundation
import SwiftUI
import AnimatedGradientView

enum ThemeStyle: String, CaseIterable {
    case standard
    case theme1
    case theme2
    
    static func getTheme(_ rawValue: String) -> Theme {
        for style in ThemeStyle.allCases {
            if rawValue.localizedLowercase == style.rawValue.localizedLowercase {
                return style.getTheme()
            }
        }
        return .standard
    }
    
    private func getTheme() -> Theme {
        switch self {
        case .standard:
            return Theme.standard
        case .theme1:
            return Theme.theme1
        case .theme2:
            return Theme.theme2
        }
    }
}

public class Theme: ObservableObject {
    
    var button: KeyboardStyle.Button
    var background: KeyboardStyle.Background
    var callout: KeyboardCalloutModel
    var sound: KeyboardSoundModel
    var disableNeonAnimationCharacter: Bool
    var disableNeonAnimationButton: Bool
    var buttonNeonAnimation: [AnimatedGradientView.AnimationValue]?
    var backgroundNeonAnimation: [AnimatedGradientView.AnimationValue]?
    
    init(
        button: KeyboardStyle.Button,
        background: KeyboardStyle.Background,
        callout: KeyboardCalloutModel,
        sound: KeyboardSoundModel,
        disableNeonAnimationCharacter: Bool = false,
        disableNeonAnimationButton: Bool = false,
        buttonNeonAnimation: [AnimatedGradientView.AnimationValue]? = nil,
        backgroundNeonAnimation: [AnimatedGradientView.AnimationValue]? = nil
    ) {
        self.button = button
        self.background = background
        self.callout = callout
        self.sound = sound
        self.buttonNeonAnimation = buttonNeonAnimation
        self.backgroundNeonAnimation = backgroundNeonAnimation
        self.disableNeonAnimationCharacter = disableNeonAnimationCharacter
        self.disableNeonAnimationButton = disableNeonAnimationButton
    }
}

extension Theme {
    
    static var standard: Theme = .init(
        button: .init(
            background: .color(.red),
            foregroundColor: .red,
            font: .footnote,
            cornerRadius: 15,
            border: .init(color: .blue, size: 2)
        ),
        background: .color(.black),
        callout: .init(background: .black ),
        sound: .init(name: "sound name", volume: 10)
    )
    
    static var theme1: Theme = .init(
        button: .init(
            background: .color(.clear),
            foregroundColor: .blue,
            font: .footnote,
            cornerRadius: 15,
            border: .init(color: .blue, size: 2)
        ),
        background: .color(.black),
        callout: .init(background: .black ),
        sound: .init(name: "sound name", volume: 10),
//        disableNeonAnimationCharacter: true, 
//        disableNeonAnimationButton: true,
        buttonNeonAnimation: NeonStyle.colorStrip.getStyle()
    )
    
    static var theme2: Theme = .init(
        button: .init(
            background: .image(UIImage(named: "icon_button")?.pngData() ?? Data())
        ),
        background: .init(backgroundColor: .red.opacity(0.6)),
        callout: .init(background: .red),
        sound: .init(name: "abc", volume: 1),
        disableNeonAnimationButton: true,
        buttonNeonAnimation: NeonStyle.colorStrip.getStyle()
    )
}
