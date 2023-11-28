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
    case linearLTR
    case linearRTL
    case theme1
    case theme2
    case theme3
    case theme4
    
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
        case .linearLTR:
            return .linearLTR
        case .linearRTL:
            return .linearRTL
        case .theme1:
            return Theme.theme1
        case .theme2:
            return Theme.theme2
        case .theme3:
            return Theme.theme3
        case .theme4:
            return .theme4
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
    var durationAnimation: Double
    var neonLinearAnimation: NeonLinearAnimation
    
    init(
        button: KeyboardStyle.Button,
        background: KeyboardStyle.Background,
        callout: KeyboardCalloutModel,
        sound: KeyboardSoundModel,
        disableNeonAnimationCharacter: Bool = false,
        disableNeonAnimationButton: Bool = false,
        buttonNeonAnimation: [AnimatedGradientView.AnimationValue]? = nil,
        backgroundNeonAnimation: [AnimatedGradientView.AnimationValue]? = nil,
        durationAnimation: Double = 5.0,
        neonLinearAnimation: NeonLinearAnimation = .none
    ) {
        self.button = button
        self.background = background
        self.callout = callout
        self.sound = sound
        self.buttonNeonAnimation = buttonNeonAnimation
        self.backgroundNeonAnimation = backgroundNeonAnimation
        self.disableNeonAnimationCharacter = disableNeonAnimationCharacter
        self.disableNeonAnimationButton = disableNeonAnimationButton
        self.durationAnimation = durationAnimation
        self.neonLinearAnimation = neonLinearAnimation
    }
}

extension Theme {
    
    static var standard: Theme = .init(
        button: .init(
            background: .image(UIImage(named: "icon_button")?.pngData() ?? Data()),
            foregroundColor: .red,
            font: .footnote,
            cornerRadius: 15,
            border: .init(color: .blue, size: 2)
        ),
        background: .color(.black),
        callout: .init(background: .black ),
        sound: .init(name: "sound name", volume: 10),
        disableNeonAnimationCharacter: true,
        buttonNeonAnimation: NeonStyle.standard.getStyle(),
        durationAnimation: 1
    )
    
    static var linearLTR: Theme = .init(
        button: .init(
            background: .color(.blue),
            foregroundColor: .red,
            font: .footnote,
            cornerRadius: 15,
            border: .init(color: .blue, size: 2)
        ),
        background: .color(.black),
        callout: .init(background: .black ),
        sound: .init(name: "sound name", volume: 10),
        disableNeonAnimationCharacter: true,
        durationAnimation: 1,
        neonLinearAnimation: .LTR
    )
    
    static var linearRTL: Theme = .init(
        button: .init(
            background: .color(.clear),
            foregroundColor: .red,
            font: .footnote,
            cornerRadius: 15,
            border: .init(color: .blue, size: 2)
        ),
        background: .color(.black),
        callout: .init(background: .black ),
        sound: .init(name: "sound name", volume: 10),
//        disableNeonAnimationButton: true,
        durationAnimation: 10,
        neonLinearAnimation: .RTL
    )
    
    static var theme1: Theme = .init(
        button: .init(
            background: .color(.red),
            foregroundColor: .blue,
            font: .footnote,
            cornerRadius: 15,
            border: .init(color: .blue, size: 2)
        ),
        background: .color(.black),
        callout: .init(background: .black ),
        sound: .init(name: "sound name", volume: 10),
        disableNeonAnimationCharacter: true, 
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
    
    static var theme3: Theme = .init(
        button: .init(
            background: .color(.red)
        ),
        background: .init(backgroundColor: .red.opacity(0.6)),
        callout: .init(background: .red),
        sound: .init(name: "abc", volume: 1),
        disableNeonAnimationCharacter: true,
//        disableNeonAnimationButton: true,
        buttonNeonAnimation: NeonStyle.colorStrip.getStyle()
    )
    
    static var theme4: Theme = .init(
        button: .init(
            background: .image(UIImage(named: "icon_button")?.pngData() ?? Data())
        ),
        background: .init(backgroundColor: .red.opacity(0.6)),
        callout: .init(background: .red),
        sound: .init(name: "abc", volume: 1),
        disableNeonAnimationButton: true,
        backgroundNeonAnimation: NeonStyle.colorRotate4Conic.getStyle()
    )
}
