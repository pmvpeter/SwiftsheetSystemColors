//
//  UIColorExtensions.swift
//  SystemColors
//
//  Created by Pedro Vasconcelos on 20/03/2020.
//  Copyright © 2020 PMV Peter. All rights reserved.
//

import UIKit

extension UIColor {

    func rgbaValues() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }

    func rgbString() -> String {
        let rgba = rgbaValues()
        let r = Int((rgba.0 * 255).rounded(.toNearestOrAwayFromZero))
        let g = Int((rgba.1 * 255).rounded(.toNearestOrAwayFromZero))
        let b = Int((rgba.2 * 255).rounded(.toNearestOrAwayFromZero))

        return "\(r), \(g), \(b)"
    }

    func hexString() -> String {
        let rgba = rgbaValues()

        return String(format: "#%02lX%02lX%02lX", lroundf(Float(rgba.0 * 255)), lroundf(Float(rgba.1 * 255)), lroundf(Float(rgba.2 * 255)))
    }
    
}
