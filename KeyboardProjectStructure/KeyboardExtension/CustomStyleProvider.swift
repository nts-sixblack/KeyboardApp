//
//  CustomStyleProvider.swift
//  KeyboardExtension
//
//  Created by MaxMobile Software on 24/11/2023.
//

import Foundation

class CustomStyleProvider: StandardKeyboardStyleProvider {
    
    let sharedDefault = UserDefaults(suiteName: "group.com.maxmobile.NeonLedKeyboard")!
    
    var theme: Theme? {
        if let themeName = sharedDefault.string(forKey: Constant.THEME_KEYBOARD) {
            return ThemeStyle.getTheme(themeName)
        } else {
            return nil
        }
    }
    
    override func buttonStyle(
        for action: KeyboardAction,
        isPressed: Bool
    ) -> KeyboardStyle.Button {
        var style = super.buttonStyle(for: action, isPressed: isPressed)
        
        if let theme = theme {
            style = theme.button
        }
        
        return style
    }
    
    override var actionCalloutStyle: KeyboardStyle.ActionCallout {
        var style = super.actionCalloutStyle
        style.callout.backgroundColor = .red
        style.callout.textColor = .yellow
        style.selectedBackgroundColor = .black.opacity(0.2)
        return style
    }
    
    override var inputCalloutStyle: KeyboardStyle.InputCallout {
        var style = super.inputCalloutStyle
        style.callout.backgroundColor = .blue
        style.callout.textColor = .yellow
        style.callout.hidden = true
        return style
    }
}
