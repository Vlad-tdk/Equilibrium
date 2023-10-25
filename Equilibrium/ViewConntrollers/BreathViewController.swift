//
//  FireMeditationController.swift
//  Equilibrium
//
//  Created by Vlad on 28.5.23..
//

import UIKit

protocol SettingBreathViewControllerDelegate: AnyObject {
    func setColorView(_ color: UIColor)
    func setColor(_ color: UIColor)
    
}

final class BreathViewController: UIViewController {
    
    @IBOutlet weak var settingBreathButton: UIButton!
    @IBOutlet weak var viewColor: UIView!
    
    
    private var animationStarted = true
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingBreathViewController
        else { return }
        settingsVC.delegate = self
        settingsVC.bColor = viewColor.backgroundColor
        settingsVC.backgroundColorView = view.backgroundColor
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setColors()
        viewColor.layer.cornerRadius = viewColor.frame.width / 2
    }
    
    @IBAction func startStopButtonTapped(_ sender: UIButton) {
        
        if !animationStarted{
            viewColor.layer.removeAllAnimations()
            self.viewColor.transform = CGAffineTransform(scaleX: 1, y: 1)
            navigationController?.navigationBar.isHidden.toggle()
            animationStarted.toggle()
            sender.setTitle("START", for: .normal)
        } else{
            viewColor.breath(times: 15)
            navigationController?.navigationBar.isHidden.toggle()
            animationStarted.toggle()
            sender.setTitle("STOP", for: .normal)
        }
    }
    
}

// MARK: - ColorDelegate
extension BreathViewController: SettingBreathViewControllerDelegate {
    func setColor (_ color: UIColor) {
        viewColor.backgroundColor = color
    }
    
    func setColorView(_ color: UIColor){
        view.backgroundColor = color
    }
}
extension BreathViewController{
    
    private func setColors(){
        let settingsColor = StorageManager.shared.fetchSettingsColorBreath()
        let settingColorView = settingsColor[0]
        let settingColorViewPoint = settingsColor[1]
        
        view.backgroundColor = UIColor(
            red: CGFloat(settingColorView.red),
            green: CGFloat(settingColorView.green),
            blue: CGFloat(settingColorView.blue),
            alpha: 1)
        
        viewColor.backgroundColor = UIColor(
            red: CGFloat(settingColorViewPoint.red),
            green: CGFloat(settingColorViewPoint.green),
            blue: CGFloat(settingColorViewPoint.blue),
            alpha: 1)
        
    }
}

