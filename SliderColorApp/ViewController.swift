//
//  ViewController.swift
//  SliderColorApp
//
//  Created by Daniil on 3.03.22.
//

import UIKit

class ViewController: UIViewController {
    
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
    }
    
    @IBAction func sliderChanged() {
        
        redSliderValue.text = String(round(redSlider.value / 255.0 * 100.0 ) / 100)
        greenSliderValue.text = String(round(greenSlider.value / 255.0 * 100) / 100)
        blueSliderValue.text = String(round(blueSlider.value / 255.0 * 100) / 100)
        
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value) / 255,
            green: CGFloat(greenSlider.value) / 255,
            blue: CGFloat(blueSlider.value) / 255, alpha: 1
        )
    }
}
