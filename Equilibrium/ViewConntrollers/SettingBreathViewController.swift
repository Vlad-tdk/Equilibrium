//
//  SettingBreathViewController.swift
//  Equilibrium
//
//  Created by Vlad on 6.6.23..
//

import UIKit

final class SettingBreathViewController: UIViewController {
    
    @IBOutlet weak var colorViewSetting: UIView!
    @IBOutlet weak var backGroundView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redSliderView: UISlider!
    @IBOutlet weak var greenSliderView: UISlider!
    @IBOutlet weak var blueSliderView: UISlider!
    
    
    // MARK: - Public Properties
    
    unowned var delegate: SettingBreathViewControllerDelegate!
    var viewColor: UIView!
    var bColor: UIColor!
    var backgroundColorView: UIColor!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setVerticalGradient()
        colorViewSetting.layer.cornerRadius = colorViewSetting.frame.width / 2
        colorViewSetting.backgroundColor = bColor
        backGroundView.backgroundColor = backgroundColorView
        setValueView(for: redSliderView, greenSliderView, blueSliderView)
        setValue(for: redSlider, greenSlider, blueSlider)
    }
    

    @IBAction func donePressedButton(_ sender: Any) {
        delegate.setColor(colorViewSetting.backgroundColor ?? .clear)
        delegate.setColorView(backGroundView.backgroundColor ?? .clear)
        StorageManager.shared.saveSettingsBreath(getColors())
        dismiss(animated: true)
    }
    
    @IBAction func rgbSliderView(_ sender: UISlider) {
        setColorView()
    }
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
    }
    private func setColor() {
        colorViewSetting.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setColorView() {
        backGroundView.backgroundColor = UIColor(
            red: CGFloat(redSliderView.value),
            green: CGFloat(greenSliderView.value),
            blue: CGFloat(blueSliderView.value),
            alpha: 1
        )
    }
    private func setValueView(for colorSliderView: UISlider...) {
        let ciColor = CIColor(color: backgroundColorView)
        colorSliderView.forEach { slider in
            switch slider {
            case redSliderView: redSliderView.value = Float(ciColor.red)
            case greenSliderView: greenSliderView.value = Float(ciColor.green)
            default: blueSliderView.value = Float(ciColor.blue)
            }
        }
    }
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: bColor)
        colorSliders.forEach { slider in
            switch slider {
            case redSlider: redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
}
extension SettingBreathViewController {
    private func getColors() -> [ColorView]{
        let backGroundColorView = ColorView(red: redSliderView.value, 
                                            green: greenSliderView.value,
                                            blue: blueSliderView.value, alfa: 1)
        let backGroundColorPoint = ColorView(red: redSlider.value, 
                                             green: greenSlider.value,
                                             blue: blueSlider.value, alfa: 1)
        var colorsSetting: [ColorView] = []
        colorsSetting.append(backGroundColorView)
        colorsSetting.append(backGroundColorPoint)
        return colorsSetting
    }
}
