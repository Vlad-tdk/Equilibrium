//
//  Extension+UIAlert.swift
//  Equilibrium
//
//  Created by Vlad on 23.9.23..
//

import UIKit

extension UIViewController {
    
    func alertClue(_ title: String, _ message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
