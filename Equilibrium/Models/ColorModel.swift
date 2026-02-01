//
//  ColorModel.swift
//  Equilibrium
//
//  Created by Vlad on 30. 1. 2026..
//

import SwiftUI

// MARK: - Color Model
struct ColorModel: Codable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
    init(from color: Color) {
        let uiColor = UIColor(color)
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        self.red = Double(r)
        self.green = Double(g)
        self.blue = Double(b)
        self.alpha = Double(a)
    }
    
    func toColor() -> Color {
        Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}
