//
//  UIApplication.swift
//  KeyboardProjectStructure
//
//  Created by MaxMobile Software on 24/11/2023.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
