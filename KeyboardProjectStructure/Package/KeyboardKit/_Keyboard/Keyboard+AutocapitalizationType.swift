//
//  Keyboard+AutocapitalizationType.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2023-03-26.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Keyboard {
 
    /// This enum defines various autocapitalization types.
    enum AutocapitalizationType: String, CaseIterable {

        // All characters should be auto-capitalized.
        case allCharacters

        // All new sentences should be auto-capitalized.
        case sentences

        // All new words should be auto-capitalized.
        case words

        // Auto-capitalization should not be applied.
        case none
        
        public static func getType(_ rawValue: String) -> AutocapitalizationType {
            for style in AutocapitalizationType.allCases {
                if rawValue.localizedLowercase == style.rawValue.localizedLowercase {
                    return style
                }
            }
            return .sentences
        }
    }
}

#if os(iOS) || os(tvOS)
import UIKit

public extension UITextAutocapitalizationType {

    /// Map this type to a ``Keyboard/AutocapitalizationType``.
    var keyboardType: Keyboard.AutocapitalizationType {
        switch self {
        case .none: return .none
        case .words: return .words
        case .sentences: return .sentences
        case .allCharacters: return .allCharacters
        @unknown default: return .none
        }
    }
}
#endif
