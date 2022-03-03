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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 25
    }
    
    @IBAction func redSliderValueChanged() {
        
    }
    @IBAction func greenSliderValueChanged() {
        
    }
    @IBAction func blueSliderValueChanged() {
        
    }

}

