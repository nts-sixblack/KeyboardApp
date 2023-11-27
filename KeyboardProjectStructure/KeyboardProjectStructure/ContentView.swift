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
                sharedDefault.set("theme1", forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Theme1")
            })
            
            Button(action: {
                sharedDefault.set("theme2", forKey: Constant.THEME_KEYBOARD)
                UIApplication.shared.endEditing()
            }, label: {
                Text("Theme2")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
