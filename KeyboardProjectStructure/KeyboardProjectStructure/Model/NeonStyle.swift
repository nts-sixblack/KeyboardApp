//
//  NeonStyle.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 28/11/2023.
//

import Foundation
import AnimatedGradientView
import CoreGraphics
import QuartzCore

enum NeonStyle: String, CaseIterable {
    
//    public typealias AnimationValue = (colors: [String], Direction, CAGradientLayerType)
//    public typealias Direction = AnimatedGradientViewDirection
    
    init?(rawValue: String) {
        let style = Self.allCases.first(where: { $0.rawValue.localizedLowercase == rawValue.localizedLowercase })
        guard let style = style else { return nil }
        self = style
    }
    
    case none
    case standard
    case colorStrip
    
    public func getStyle() -> [AnimatedGradientView.AnimationValue]? {
        switch self {
        case .none:
            return []
        case .standard:
            return standardStyle
        case .colorStrip:
            return colorStripStyle
        }
    }
    
    var standardStyle: [AnimatedGradientView.AnimationValue] {
        return [
            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .down, .axial),
            (colors: ["#FEAC5E", "#C779D0", "#fcb045"], .down, .axial),
            (colors: ["#43cea2", "#185a9d"], .down, .axial),
            (colors: ["#003973", "#E5E5BE"], .downRight, .axial)
        ]
    }
    
    var colorStripStyle: [AnimatedGradientView.AnimationValue] {
        return [
            (colors: ["#fc00ff", "#00dbde"], .left, .radial),
            (colors: ["#4568DC", "#B06AB3"], .upLeft, .axial),
            (colors: ["#360033", "#0b8793"], .up, .radial),
            (colors: ["#03001e", "#7303c0", "#ec38bc", "#fdeff9"], .upRight, .radial)
        ]
    }
}
