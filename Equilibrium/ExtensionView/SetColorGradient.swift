//
//  SetColor.swift
//  AboutMeApp
//
//  Created by Vlad on 9.5.23..
//
import UIKit

extension UICollectionViewCell {
    func setVerticalGradientLayer() {
        let primaryColor = UIColor(
            red: 109/255,
            green: 255/255,
            blue: 128/255,
            alpha: 0.5
        )
        
        let secondaryColor = UIColor(
            red: 107/255,
            green: 148/255,
            blue: 255/255,
            alpha: 0.4
        )
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.3, y: 0.0) // Начальная точка градиента (верхний центр)
        gradient.endPoint = CGPoint(x: 0.3, y: 1.0) //
        contentView.layer.insertSublayer(gradient, at: 0)
    }
}

extension UIView {
    func setVerticalGradient() {
        let primaryColor = UIColor(
            red: 62/255,
            green: 115/255,
            blue: 82/255,
            alpha: 0.9
        )
        
        let secondaryColor = UIColor(
            red: 107/255,
            green: 148/255,
            blue: 203/255,
            alpha: 0.9
        )
        
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [primaryColor.cgColor, secondaryColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0) // Начальная точка градиента (верхний центр)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0) //
        layer.insertSublayer(gradient, at: 0)
    }
}
