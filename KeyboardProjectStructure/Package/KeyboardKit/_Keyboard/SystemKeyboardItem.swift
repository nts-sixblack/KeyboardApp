//
//  SystemKeyboardItem.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-12-02.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view renders button item for a ``SystemKeyboard``.
 */
public struct SystemKeyboardItem<Content: View>: View {
    
    let sharedDefault = UserDefaults(suiteName: Constant.GROUP_APP)!
    
    /**
     Create a system keyboard button row item.
     
     - Parameters:
       - item: The layout item to use within the item.
       - actionHandler: The button style to apply.
       - styleProvider: The style provider to use.
       - keyboardContext: The keyboard context to which the item should apply.,
       - calloutContext: The callout context to affect, if any.
       - keyboardWidth: The total width of the keyboard.
       - inputWidth: The input width within the keyboard.
       - content: The content view to use within the item.
     */
    init(
        item: KeyboardLayout.Item,
        actionHandler: KeyboardActionHandler,
        styleProvider: KeyboardStyleProvider,
        keyboardContext: KeyboardContext,
        calloutContext: CalloutContext?,
        keyboardWidth: CGFloat,
        inputWidth: CGFloat,
        overlayKeyboard: Bool,
        theme: Theme,
        content: Content
    ) {
        self.item = item
        self.actionHandler = actionHandler
        self.styleProvider = styleProvider
        self._keyboardContext = ObservedObject(wrappedValue: keyboardContext)
        self.calloutContext = calloutContext
        self.keyboardWidth = keyboardWidth
        self.inputWidth = inputWidth
        self.content = content
        
        self.overlayKeyboard = overlayKeyboard
        self.theme = theme
    }
    
    private let item: KeyboardLayout.Item
    private let actionHandler: KeyboardActionHandler
    private let styleProvider: KeyboardStyleProvider
    private let calloutContext: CalloutContext?
    private let keyboardWidth: CGFloat
    private let inputWidth: CGFloat
    private let content: Content
    
    private let overlayKeyboard: Bool
    private let theme: Theme
    
    @ObservedObject
    private var keyboardContext: KeyboardContext
    
    @State
    private var isPressed = false
    
    @State private var specialCharacter: String = ""
    
    public var body: some View {
        content
            .opacity(contentOpacity)
            .animation(.default, value: keyboardContext.isSpaceDragGestureActive)
            .keyboardLayoutItemSize(
                for: item,
                rowWidth: keyboardWidth,
                inputWidth: inputWidth)
            .keyboardButton(
                for: item.action,
                style: buttonStyle,
                actionHandler: actionHandler,
                keyboardContext: keyboardContext,
                calloutContext: calloutContext,
                edgeInsets: item.edgeInsets,
                isPressed: $isPressed
            )
            .overlay(alignment: .topTrailing) {
                Text("\(specialCharacter)")
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .offset(x: -5, y: 5)
                    .onAppear {
                        if sharedDefault.bool(forKey: Constant.SHOW_SPECIAL_KEY) {
                            switch item.action {
                            case .character(_):
                                let firstAction = calloutContext?.actionContext.actionProvider?.calloutActions(for: item.action).first
                                switch firstAction {
                                case .character(let characacter):
                                    specialCharacter = characacter
                                default: break
                                }
                            default: break
                            }
                        }
                    }
            }
    }
    
    private var contentOpacity: Double {
        keyboardContext.isSpaceDragGestureActive ? 0 : 1
    }
    
    private var buttonStyle: KeyboardStyle.Button {
        var style = item.action.isSpacer ? .spacer : styleProvider.buttonStyle(for: item.action, isPressed: isPressed)
        
        if overlayKeyboard {
            style.background = .color(.clear)
            style.borderColor = .clear
        }
        
        return style
    }
}
