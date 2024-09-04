//
// Extension.swift
//
//

import Foundation
import UIKit
import UIColor_Hex_Swift

typealias myColor = UIColor.LocalColorName

extension UIColor {
    
    enum LocalColorName: String {
        
        case primaryColor     = "#303030"
    }
    
    convenience init(_ name: LocalColorName) {
        self.init(name.rawValue)
    }
    
    static let primaryColor     = UIColor(.primaryColor)
}
