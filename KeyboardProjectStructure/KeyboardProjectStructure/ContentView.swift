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
                sharedDefault.set(ThemeStyle.theme1.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Theme1")
            })
            
            Button(action: {
                sharedDefault.set(ThemeStyle.theme1.rawValue, forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Theme2")
            })
            
            Button(action: {
                if sharedDefault.string(forKey: Constant.AUTO_CAPITALIZATION) == Keyboard.AutocapitalizationType.sentences.rawValue {
                    sharedDefault.set(Keyboard.AutocapitalizationType.none.rawValue, forKey: Constant.AUTO_CAPITALIZATION)
                } else {
                    sharedDefault.set(Keyboard.AutocapitalizationType.sentences.rawValue, forKey: Constant.AUTO_CAPITALIZATION)
                }
                
            }, label: {
                Text("change autocaptizaltion")
            })
            
            Button(action: {
                var value = sharedDefault.bool(forKey: Constant.SHOW_SPECIAL_KEY)
                value.toggle()
                sharedDefault.set(value , forKey: Constant.SHOW_SPECIAL_KEY)
            }, label: {
                Text("Toggle show special key")
            })
            
            Button(action: {
                var value = sharedDefault.bool(forKey: Constant.POPUP_PRESS_KEY)
                value.toggle()
                sharedDefault.set(value , forKey: Constant.POPUP_PRESS_KEY)
            }, label: {
                Text("Toggle Popup Press key")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
