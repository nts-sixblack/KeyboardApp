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
    
    var theme: Theme? {
        if let themeName = sharedDefault.string(forKey: Constant.THEME_KEYBOARD) {
            return ThemeStyle.getTheme(themeName)
        } else {
            return nil
        }
    }
    
    override func viewDidLoad() {
        
        state.keyboardContext.autocapitalizationTypeOverride = .words
        
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
                VStack {
                    if let theme = self.theme {
                        theme.background.backgroundView
                    }
                }
            )
        }
    }
}
