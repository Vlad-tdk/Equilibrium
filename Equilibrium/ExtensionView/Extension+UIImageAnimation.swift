//
//  Extenson+UIImageView.swift
//  Equilibrium
//
//  Created by Vlad on 6.6.23..
//
import UIKit

extension UIView {
    
    func pulsate(_ count: Float, _ fromValue: Int, _ toValue: Int) {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = 12
        pulse.fromValue = fromValue
        pulse.toValue = toValue
        //pulse.autoreverses = true
        pulse.repeatCount = count
        layer.add(pulse, forKey: "transform.scale")
        
        
    }
    
    func breath(times: Int){
        if times <= 0 {
            // Все анимации завершены
            
            return
        }
        UIView.animate(withDuration: 8.0, animations: {
            // Анимация, которая будет выполняться в течение 8 секунд
            self.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }) { (finished) in
            if finished {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    UIView.animate(withDuration: 8.0, animations: {
                        // Анимация, которая будет выполняться в течение 8 секунд
                        self.transform = CGAffineTransform(scaleX: 1, y: 1)
                    }) { (finished) in
                        if finished {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                                self.breath(times: times - 1)
                            }
                        } // Анимация завершилась
                        
                    }// Здесь вы можете выполнить дополнительные действия после завершения анимации
                    }
                }
            }
        }
        
        func rotateView(_ rotateRigth: Bool){
            let rotate = CABasicAnimation(keyPath: "transform.rotation")
            if rotateRigth == true{
                rotate.repeatCount = 1
                rotate.duration = 2500
                rotate.fromValue = 0
                rotate.toValue = 360
                self.layer.add(rotate, forKey: "transform.rotation")
            } else {
                rotate.repeatCount = 1
                rotate.duration = 2500
                rotate.fromValue = 0
                rotate.toValue = -360
                self.layer.add(rotate, forKey: "transform.rotation")
            }
            
        }
        
        
    }

