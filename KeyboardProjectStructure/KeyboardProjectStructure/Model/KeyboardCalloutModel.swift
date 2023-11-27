//
//  KeyboardCalloutModel.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 23/11/2023.
//

import Foundation
import SwiftUI

struct KeyboardCalloutModel: Codable {
    public init(
        background: Color = .white
    ) {
        self.backgroundColor = background
    }
    
    /// A background color to apply.
    public var backgroundColor: Color
    
}
