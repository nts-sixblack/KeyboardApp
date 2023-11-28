//
//  ContentView.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    
    let sharedDefault = UserDefaults(suiteName: "group.com.maxmobile.NeonLedKeyboard")!
    
    @State var text = ""
    
    var body: some View {
        VStack {
            
            TextField("text", text: $text)
            
            Button(action: {
                sharedDefault.set(ThemeStyle.standard.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Standard led animation")
            })
            
            Button(action: {
                sharedDefault.set(ThemeStyle.linearLTR.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Linear LTR")
            })
            
            Button(action: {
                sharedDefault.set(ThemeStyle.linearRTL.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Linear RTL")
            })
            
            Button(action: {
                sharedDefault.set(ThemeStyle.theme1.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Theme1")
            })
            
            Button(action: {
                sharedDefault.set(ThemeStyle.theme2.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Theme2")
            })
            
            Button(action: {
                sharedDefault.set(ThemeStyle.theme3.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Theme3")
            })
            
            Button(action: {
                sharedDefault.set(ThemeStyle.theme4.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Theme4")
            })
            
            Button(action: {
                if sharedDefault.string(forKey: Constant.AUTO_CAPITALIZATION) == Keyboard.AutocapitalizationType.sentences.rawValue {
                    sharedDefault.set(Keyboard.AutocapitalizationType.none.rawValue, forKey: Constant.AUTO_CAPITALIZATION)
                } else {
                    sharedDefault.set(Keyboard.AutocapitalizationType.sentences.rawValue, forKey: Constant.AUTO_CAPITALIZATION)
                }
                UIApplication.shared.endEditing()
            }, label: {
                Text("change autocaptizaltion")
            })
            
            Button(action: {
                var value = sharedDefault.bool(forKey: Constant.SHOW_SPECIAL_KEY)
                value.toggle()
                sharedDefault.set(value , forKey: Constant.SHOW_SPECIAL_KEY)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Toggle show special key")
            })
            
            Button(action: {
                var value = sharedDefault.bool(forKey: Constant.POPUP_PRESS_KEY)
                value.toggle()
                sharedDefault.set(value , forKey: Constant.POPUP_PRESS_KEY)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Toggle Popup Press key")
            })
            
            Button(action: {
                var value = sharedDefault.bool(forKey: Constant.SHOW_SUGGESTIONS)
                value.toggle()
                sharedDefault.set(value , forKey: Constant.SHOW_SUGGESTIONS)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Toggle show suggestion")
            })
            
            Button(action: {
                var value = sharedDefault.bool(forKey: Constant.AUTO_COMPLETE)
                value.toggle()
                sharedDefault.set(value , forKey: Constant.AUTO_COMPLETE)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Toggle auto complete")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
