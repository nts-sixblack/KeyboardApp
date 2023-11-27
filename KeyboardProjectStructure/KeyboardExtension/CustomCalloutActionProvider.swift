//
//  CustomCalloutActionProvider.swift
//  KeyboardExtension
//
//  Created by MaxMobile Software on 27/11/2023.
//

import Foundation

class CustomCalloutActionProvider: StandardCalloutActionProvider {
    
    open func calloutActionString(for char: String) -> String {
        switch char {
            
        case "q": return "1"
        case "w": return "2"
        case "e": return "3eèéêëēėę"
        case "r": return "4"
        case "t": return "5"
        case "y": return "6yÿ"
        case "u": return "7uûüùúū"
        case "i": return "8iîïíīįì"
        case "o": return "9oôöòóœøōõ"
        case "p": return "0"
            
        case "a": return "aàáâäæãåā"
        case "s": return "#sßśš"
        case "d": return "$"
        case "f": return "%"
        case "g": return "&"
        case "h": return "-"
        case "j": return "+"
        case "k": return "("
        case "l": return ")lł"
            
        case "z": return "*zžźż"
        case "x": return "\""
        case "c": return "'cçćč"
        case "v": return ":"
        case "b": return ";"
        case "n": return "!nñń"
        case "m": return "?"
            
        case "0": return "0°"
            
        case "-": return "-–—•"
        case "/": return "/\\"
        case "$": return "$₽¥€¢£₩"
        case "&": return "&§"
        case "”": return "\"„“”«»"
        case ".": return ".…"
        case "?": return "?¿"
        case "!": return "!¡"
        case "’": return "'’‘`"
            
        case "%": return "%‰"
        case "=": return "=≠≈"
            
        default: return ""
        }
    }
}
