//
//  MainViewController.swift
//  SliderColorApp
//
//  Created by Daniil on 19.03.22.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet var mainViewBackground: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewBackground.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colorViewColor = mainViewBackground
    }
}
