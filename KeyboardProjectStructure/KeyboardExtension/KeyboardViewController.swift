//
//  KeyboardViewController.swift
//  KeyboardExtension
//
//  Created by MaxMobile Software on 23/11/2023.
//

import UIKit
import SwiftUI

class KeyboardViewController: KeyboardInputViewController {
    
    let sharedDefault = UserDefaults(suiteName: "group.com.maxmobile.NeonLedKeyboard")!
    
    var theme: Theme {
        if let themeName = sharedDefault.string(forKey: Constant.THEME_KEYBOARD) {
            return ThemeStyle.getTheme(themeName)
        } else {
            return .standard
        }
    }
    
    override func viewDidLoad() {
        
        /// auto capitalization
        state.keyboardContext.autocapitalizationTypeOverride = Keyboard.AutocapitalizationType.getType(sharedDefault.string(forKey: Constant.AUTO_CAPITALIZATION) ?? "")
        
        /// enable show suggestion
        state.autocompleteContext.isEnabled = sharedDefault.bool(forKey: Constant.SHOW_SUGGESTIONS)
        
        /// theme keyboard
        state.keyboardTheme = theme
        
        /// service suggestion
        services.autocompleteProvider = CustomAutoCompleteProvider()
        
        /// style provider
        /// style of keyboard button and callout action
        services.styleProvider = CustomStyleProvider(keyboardContext: state.keyboardContext)
        
        /// layout of keyboard
        /// custom special character
        services.layoutProvider = CustomLayourProvider()
        
        /// action when long press on button, will show list special character
        services.calloutActionProvider = CustomCalloutActionProvider(keyboardContext: state.keyboardContext)
        
        super.viewDidLoad()
    }
    
    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()

        /// 💡 Make the demo use a standard ``SystemKeyboard``.
        ///
        /// This is not needed if you want to use a standard
        /// view, but this is how you can setup a custom one.
        setup { controller in
            SystemKeyboard(
                state: controller.state,
                services: controller.services,
                buttonContent: { $0.view },
                buttonView: { $0.view },
                emojiKeyboard: { $0.view },
                toolbar: { $0.view }
            )
            .background(
                ZStack {
                    self.theme.background.backgroundView
                    if let backgroundNeonAnimation = self.theme.backgroundNeonAnimation {
                        AnimatedGradient(animationValues: backgroundNeonAnimation)
                    }
                }
            )
        }
    }
}
