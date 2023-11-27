//
//  KeyboardSoundModel.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 23/11/2023.
//

import Foundation
import SwiftUI

struct KeyboardSoundModel: Codable {
    public var name: String
    public var volume: Float
    
    public init(name: String, volume: Float) {
        self.name = name
        self.volume = volume
    }
}
