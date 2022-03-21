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
    
    @IBOutlet weak var redSliderField: UITextField!
    @IBOutlet weak var greenSliderField: UITextField!
    @IBOutlet weak var blueSliderField: UITextField!
    
    var colorViewColor: UIView!
    var colorGetter: UIColor!
    
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gettingColor()
        colorView.layer.cornerRadius = 25
        
        addDoneButtonOnNumpad(textField: redSliderField)
        addDoneButtonOnNumpad(textField: greenSliderField)
        addDoneButtonOnNumpad(textField: blueSliderField)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redSliderValue.text = string(from: redSlider)
            redSliderField.text = string(from: redSlider)
        case greenSlider:
            greenSliderValue.text = string(from: greenSlider)
            greenSliderField.text = string(from: greenSlider)
        default:
            blueSliderValue.text = string(from: blueSlider)
            blueSliderField.text = string(from: blueSlider)
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(for: colorView.backgroundColor ?? .black)
        dismiss(animated: true)
        view.endEditing(true)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value), alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { sliderValue in
            switch sliderValue {
            case redSliderValue:
                redSliderValue.text = string(from: redSlider)
                sliderChanged(redSlider)
            case greenSliderValue:
                greenSliderValue.text = string(from: greenSlider)
                sliderChanged(greenSlider)
            default:
                blueSliderValue.text = string(from: blueSlider)
                sliderChanged(blueSlider)
            }
        }
    }
    
    private func setField(for fields: UITextField...) {
        fields.forEach { fieldValue in
            switch fieldValue {
            case redSliderField:
                redSliderField.text = string(from: redSlider)
                sliderChanged(redSlider)
            case greenSliderField:
                greenSliderField.text = string(from: greenSlider)
                sliderChanged(greenSlider)
            default:
                blueSliderField.text = string(from: blueSlider)
                sliderChanged(blueSlider)
            }
        }
    }
    
    private func gettingColor() {
        let color = CIColor(color: colorGetter)
        
        redSlider.value = Float(color.red)
        sliderChanged(redSlider)
        
        greenSlider.value = Float(color.green)
        sliderChanged(greenSlider)
        
        blueSlider.value = Float(color.blue)
        sliderChanged(blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value )
    }
}

//MARK: - touchesBegan

extension SettingsViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let newField = textField.text else {
            showAlert()
            return
        }
        guard let numberField = Float(newField) else {
            showAlert()
            return
        }
        
        if numberField > 1 {
            showAlert()
        }
        
        if textField == redSliderField {
            redSliderField.text = String(numberField)
            redSlider.value = numberField
            sliderChanged(redSlider)
        } else if textField == greenSliderField {
            greenSliderField.text = String(numberField)
            greenSlider.value = numberField
            sliderChanged(greenSlider)
        } else {
            blueSliderField.text = String(numberField)
            blueSlider.value = numberField
            sliderChanged(blueSlider)
        }
    }
}

//MARK: - showAlert

extension SettingsViewController {
    private func showAlert() {
        
        let alert = UIAlertController(
            title: "Invalid value",
            message: "Please, enter correct value from 0 to 1",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) {_ in
            return
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//MARK: - addDoneButtonOnNumpad

extension SettingsViewController {
    private func addDoneButtonOnNumpad(textField: UITextField) {
        
        let keypadToolbar: UIToolbar = UIToolbar()
        
        keypadToolbar.items=[
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                            target: .none,
                            action: nil),
            UIBarButtonItem(title: "Done",
                            style: UIBarButtonItem.Style.done,
                            target: textField,
                            action: #selector(UITextField.resignFirstResponder))
        ]
        keypadToolbar.sizeToFit()
        textField.inputAccessoryView = keypadToolbar
    }
}


