//
//  Theme.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 23/11/2023.
//

import Foundation
import SwiftUI

enum ThemeStyle: String, CaseIterable {
    case standard
    case theme1
    case theme2
    
    static func getTheme(_ rawValue: String) -> Theme? {
        for style in ThemeStyle.allCases {
            if rawValue.localizedLowercase == style.rawValue.localizedLowercase {
                return style.getTheme()
            }
        }
        return nil
    }
    
    private func getTheme() -> Theme? {
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

struct Theme: Codable {
    
    var button: KeyboardStyle.Button
    var background: KeyboardStyle.Background
    var callout: KeyboardCalloutModel
    var sound: KeyboardSoundModel
    var neonAnimation: Bool
    
    init(button: KeyboardStyle.Button, background: KeyboardStyle.Background, callout: KeyboardCalloutModel, sound: KeyboardSoundModel, neonAnimation: Bool = false) {
        self.button = button
        self.background = background
        self.callout = callout
        self.sound = sound
        self.neonAnimation = neonAnimation
    }
    
    enum CodingKeys: String, CodingKey {
        case button
        case background
        case callout
        case sound
        case neonAnimation
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(button, forKey: .button)
        try container.encode(background, forKey: .background)
        try container.encode(callout, forKey: .callout)
        try container.encode(sound, forKey: .sound)
        try container.encode(neonAnimation, forKey: .neonAnimation)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.button = try container.decode(KeyboardStyle.Button.self, forKey: .button)
        self.background = try container.decode(KeyboardStyle.Background.self, forKey: .background)
        self.callout = try container.decode(KeyboardCalloutModel.self, forKey: .callout)
        self.sound = try container.decode(KeyboardSoundModel.self, forKey: .sound)
        self.neonAnimation = try container.decode(Bool.self, forKey: .neonAnimation)
    }
}

extension Theme {
    
    static var standard: Theme? = nil
    
    static var theme1: Theme = .init(
        button: .init(
            background: .color(.red.opacity(0.3)),
            foregroundColor: .red,
            font: .footnote,
            cornerRadius: 15,
            border: .init(color: .blue, size: 2)
        ),
        background: .color(.yellow),
        callout: .init(background: .black ),
        sound: .init(name: "sound name", volume: 10)
    )
    
    static var theme2: Theme = .init(
        button: .init(
            background: .image(UIImage(named: "icon_button")?.pngData() ?? Data())
        ),
        background: .init(backgroundColor: .red.opacity(0.6)),
        callout: .init(background: .red),
        sound: .init(name: "abc", volume: 1)
    )
}
