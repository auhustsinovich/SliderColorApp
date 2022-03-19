//
//  ViewController.swift
//  SliderColorApp
//
//  Created by Daniil on 3.03.22.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var greenSliderValue: UILabel!
    @IBOutlet weak var blueSliderValue: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 25
        setColor()
        setValue(for: redSliderValue,greenSliderValue,blueSliderValue)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redSliderValue.text = string(from: redSlider)
        case greenSlider:
            greenSliderValue.text = string(from: greenSlider)
        default:
            blueSliderValue.text = string(from: blueSlider)
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value) / 255,
            green: CGFloat(greenSlider.value) / 255,
            blue: CGFloat(blueSlider.value) / 255, alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { sliderValue in
            switch sliderValue {
            case redSliderValue:
                redSliderValue.text = string(from: redSlider)
            case greenSliderValue:
                greenSliderValue.text = string(from: greenSlider)
            default:
                blueSliderValue.text = string(from: blueSlider)
                
            }
        }
        
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value / 255 )
    }
}
