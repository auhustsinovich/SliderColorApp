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
        greenSliderValue.text = "542"
        colorView.layer.cornerRadius = 25
    }
    
    @IBAction func redSliderValueChanged() {
        redSliderValue.text = String(round(redSlider.value * 100) / 100)
        
    }
    @IBAction func greenSliderValueChanged() {
        greenSliderValue.text = String(round(greenSlider.value * 100) / 100)
        
    }
    @IBAction func blueSliderValueChanged() {
        blueSliderValue.text = String(round(blueSlider.value * 100) / 100)
    }
}

