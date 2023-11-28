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
import SwiftUI

enum NeonLinearAnimation: String, CaseIterable {
    case none, LTR, RTL
}

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
    
    case colorRotate4Axial
    case colorRotate4Conic
    case colorRotate4Radial
    
    case colorRotate8Axial
    case colorRotate8Conic
    case colorRotate8Radial
    
    public func getStyle() -> [AnimatedGradientView.AnimationValue]? {
        switch self {
            
        case .none:
            return []
        case .standard:
            return standardStyle
        case .colorStrip:
            return colorStripStyle
            
            /// Rotate 4 direction
        case .colorRotate4Axial:
            return colorRotation4Axial
        case .colorRotate4Conic:
            return colorRotation4Conic
        case .colorRotate4Radial:
            return colorRotation4Radius
            
            ///  Rotate 8 direction
        case .colorRotate8Axial:
            return colorRotation8Axial
        case .colorRotate8Conic:
            return colorRotation8Conic
        case .colorRotate8Radial:
            return colorRotation8Radial
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
    
    //    MARK: Rotate 4 direction
    var colorRotation4Axial: [AnimatedGradientView.AnimationValue] {
        return [
            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .axial),
            (colors: ["#FEAC5E", "#C779D0", "#fcb045"], .up, .axial),
            (colors: ["#43cea2", "#185a9d"], .left, .axial),
            (colors: ["#003973", "#E5E5BE"], .down, .axial)
        ]
    }
    
    var colorRotation4Conic: [AnimatedGradientView.AnimationValue] {
        return [
            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .conic),
            (colors: ["#FEAC5E", "#C779D0", "#fcb045"], .up, .conic),
            (colors: ["#43cea2", "#185a9d"], .left, .conic),
            (colors: ["#003973", "#E5E5BE"], .down, .conic)
        ]
    }
    
    var colorRotation4Radius: [AnimatedGradientView.AnimationValue] {
        return [
            (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .right, .radial),
            (colors: ["#FEAC5E", "#C779D0", "#fcb045"], .up, .radial),
            (colors: ["#43cea2", "#185a9d"], .left, .radial),
            (colors: ["#003973", "#E5E5BE"], .down, .radial)
        ]
    }
    
    //    MARK: Ratate 8 direction
    var colorRotation8Axial: [AnimatedGradientView.AnimationValue] {
        return [
            (colors: ["#833ab4", "#fd1d1d"], .right, .axial),
            (colors: ["#FEAC5E", "#fd1d1d"], .downRight, .axial),
            (colors: ["#43cea2", "#fd1d1d"], .down, .axial),
            (colors: ["#003973", "#fd1d1d"], .downLeft, .axial),
            (colors: ["#00bf8f", "#fd1d1d"], .left, .axial),
            (colors: ["#E55D87", "#fd1d1d"], .upLeft, .axial),
            (colors: ["#fc00ff", "#fd1d1d"], .up, .axial),
            (colors: ["#fc00ff", "#fd1d1d"], .upRight, .axial)
        ]
    }
    
    var colorRotation8Conic: [AnimatedGradientView.AnimationValue] {
        return [
            (colors: ["#833ab4", "#fd1d1d"], .right, .conic),
            (colors: ["#FEAC5E", "#fd1d1d"], .downRight, .conic),
            (colors: ["#43cea2", "#fd1d1d"], .down, .conic),
            (colors: ["#003973", "#fd1d1d"], .downLeft, .conic),
            (colors: ["#00bf8f", "#fd1d1d"], .left, .conic),
            (colors: ["#E55D87", "#fd1d1d"], .upLeft, .conic),
            (colors: ["#fc00ff", "#fd1d1d"], .up, .conic),
            (colors: ["#fc00ff", "#fd1d1d"], .upRight, .conic)
        ]
    }
    
    var colorRotation8Radial: [AnimatedGradientView.AnimationValue] {
        return [
            (colors: ["#833ab4", "#fd1d1d"], .right, .radial),
            (colors: ["#FEAC5E", "#fd1d1d"], .downRight, .radial),
            (colors: ["#43cea2", "#fd1d1d"], .down, .radial),
            (colors: ["#003973", "#fd1d1d"], .downLeft, .radial),
            (colors: ["#00bf8f", "#fd1d1d"], .left, .radial),
            (colors: ["#E55D87", "#fd1d1d"], .upLeft, .radial),
            (colors: ["#fc00ff", "#fd1d1d"], .up, .radial),
            (colors: ["#fc00ff", "#fd1d1d"], .upRight, .radial)
        ]
    }
}

#Preview {
    AnimatedGradient(animationDuration: 1, animationValues: NeonStyle.colorRotate4Axial.getStyle())
        .previewDisplayName("4 Axial")
}

#Preview {
    AnimatedGradient(animationDuration: 1, animationValues: NeonStyle.colorRotate4Conic.getStyle())
        .previewDisplayName("4 Conic")
}

#Preview {
    AnimatedGradient(animationDuration: 1, animationValues: NeonStyle.colorRotate4Radial.getStyle())
        .previewDisplayName("4 Radial")
}

//#Preview {
//    AnimatedGradient(animationDuration: 1, animationValues: NeonStyle.colorRotate8Axial.getStyle())
//        .previewDisplayName("8 Axial")
//}
//
//#Preview {
//    AnimatedGradient(animationDuration: 1, animationValues: NeonStyle.colorRotate8Conic.getStyle())
//        .previewDisplayName("8 Conic")
//}
//
//#Preview {
//    AnimatedGradient(animationDuration: 1, animationValues: NeonStyle.colorRotate8Radial.getStyle())
//        .previewDisplayName("8 Radial")
//}

#Preview {
    AnimatedGradient(animationDuration: 1, animationValues: [
        (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .up, .axial),
        (colors: ["#FEAC5E", "#C779D0", "#fcb045"], .upRight, .axial),
                                                             
        (colors: ["#43cea2", "#185a9d"], .right, .conic),
        (colors: ["#003973", "#E5E5BE"], .downRight, .conic),
                                                             (colors: ["#00bf8f", "#001510"], .down, .axial),
                                                             (colors: ["#E55D87", "#5FC3E4"], .downLeft, .radial),
                                                             (colors: ["#fc00ff", "#00dbde"], .left, .radial),
                                                             (colors: ["#4568DC", "#B06AB3"], .upLeft, .axial),
                                                             (colors: ["#360033", "#0b8793"], .up, .radial),
                                                             (colors: ["#03001e", "#7303c0", "#ec38bc", "#fdeff9"], .upRight, .radial),
                                                             (colors: ["#00F260", "#0575E6"], .right, .radial),
                                                             (colors: ["#b92b27", "#1565C0"], .downRight, .axial),
                                                             (colors: ["#CC95C0", "#DBD4B4", "#FF0000"], .down, .axial),
                                                             (colors: ["#40E0D0", "#FF8C00", "#FF0080"], .downLeft, .axial),
                                                             (colors: ["#ff0084", "#33001b"], .left, .axial),
                                                             (colors: ["#8E0E00", "#1F1C18"], .upLeft, .axial),
                                                             (colors: ["#0099F7", "#F11712"], .up, .axial),
                                                             (colors: ["#FFA17F", "#00223E"], .upRight, .conic),
                                                             (colors: ["#C02425", "#F0CB35"], .right, .axial),
                                                             (colors: ["#00c3ff", "#ffff1c"], .downRight, .axial),
                                                             (colors: ["#004FF9", "#FFF94C"], .down, .axial),
                                                             (colors: ["#0B486B", "#F56217"], .downLeft, .axial),
                                                             (colors: ["#23074d", "#cc5333"], .left, .axial),
                                                             (colors: ["#12c2e9", "#c471ed", "#f64f59"], .right, .axial),
                                                             (colors: ["#c21500", "#ffc500"], .up, .conic),
                                                             (colors: ["#c31432", "#240b36"], .upRight, .axial),
                                                             (colors: ["#44A08D", "#093637"], .upRight, .axial),
                                                             (colors: ["#A770EF", "#CF8BF3", "#FDB99B"], .right, .axial),
                                                             (colors: ["#6A9113", "#141517"], .downLeft, .axial),
                                                             (colors: ["#A43931", "#A43931"], .upRight, .axial),
                                                             (colors: ["#1a2a6c", "#b21f1f", "#ec38bc"], .downRight, .radial),
                                                             (colors: ["#23074d", "#cc5333"], .down, .radial),
                                                             (colors: ["#544a7d", "#ffd452"], .upRight, .axial),
                                                             (colors: ["#c31432", "#240b36"], .right, .axial),
                                                             (colors: ["#0f0c29", "#302b63", "#24243e"], .downLeft, .axial),
                                                             (colors: ["#780206", "#061161"], .down, .conic),
                                                             (colors: ["#1D4350", "#A43931"], .right, .axial),
                                                             (colors: ["#FF5F6D", "#FFC371"], .downLeft, .axial),
                                                             (colors: ["#2196f3", "#f44336"], .upRight, .axial),
                                                             (colors: ["#FC5C7D", "#6a82fb"], .right, .axial),
                                                             (colors: ["#833ab4", "#fd1d1d", "#fcb045"], .up, .conic),
                                                             (colors: ["#44A08D", "#093637"], .upRight, .axial),
                                                             (colors: ["#A770EF", "#CF8BF3", "#FDB99B"], .right, .axial),
                                                             (colors: ["#40E0D0", "#FF8C00", "#FF0080"], .downLeft, .axial)])
}

#Preview {
    AnimatedGradient(animationDuration: 1, animationValues: [
        (colors: ["#833ab4", "#fd1d1d", "#833ab4"], .right, .radial),
        (colors: ["#FEAC5E", "#fd1d1d", "#FEAC5E"], .downRight, .axial),
        (colors: ["#43cea2", "#fd1d1d", "#43cea2"], .down, .conic),
        (colors: ["#003973", "#fd1d1d", "#003973"], .downLeft, .axial),
        (colors: ["#00bf8f", "#fd1d1d", "#00bf8f"], .left, .radial),
        (colors: ["#E55D87", "#fd1d1d", "#E55D87"], .upLeft, .axial),
        (colors: ["#fc00ff", "#fd1d1d", "#fc00ff"], .up, .conic),
        (colors: ["#fc00ff", "#fd1d1d", "#fc00ff"], .upRight, .axial)
    ])
}
