//
//  CustomAutoCompleteProvider.swift
//  KeyboardExtension
//
//  Created by MaxMobile Software on 27/11/2023.
//

import Foundation
import UIKit

class CustomAutoCompleteProvider: AutocompleteProvider {
    
    let sharedDefault = UserDefaults(suiteName: "group.com.maxmobile.NeonLedKeyboard")!
    
    var locale: Locale = .current
    
    var canIgnoreWords: Bool { false }
    var canLearnWords: Bool { false }
    var ignoredWords: [String] = []
    var learnedWords: [String] = []
    
    func hasIgnoredWord(_ word: String) -> Bool { false }
    func hasLearnedWord(_ word: String) -> Bool { false }
    func ignoreWord(_ word: String) {}
    func learnWord(_ word: String) {}
    func removeIgnoredWord(_ word: String) {}
    func unlearnWord(_ word: String) {}
    
    func autocompleteSuggestions(
        for text: String
    ) async throws -> [Autocomplete.Suggestion] {
        guard text.count > 0 else { return [] }
        let suggestions = getSuggestion(text)
        if suggestions.count == 0 {
            return [Autocomplete.Suggestion(text: text)]
        } else {
            return getSuggestion(text)
        }
    }
    
    private func getSuggestion(_ text: String) -> [Autocomplete.Suggestion] {
        let rangeForEndOfStr = NSMakeRange(0, text.utf16.count)
        let spellChecker = UITextChecker()
        let completions = spellChecker.completions(forPartialWordRange: rangeForEndOfStr, in: text, language: "\(locale.languageCode ?? "en_US")") ?? []
        
        var suggestions = completions.map({ text in
            return Autocomplete.Suggestion(text: text, isAutocorrect: false)
        })
    
        if sharedDefault.bool(forKey: Constant.AUTO_COMPLETE) && suggestions.count > 0 {
            suggestions[0].isAutocorrect = true
        }
        
        return suggestions 
    }
}
