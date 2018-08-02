//
//  SettingsViewController.swift
//  Planets
//
//  Created by Linh Bouniol on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var shouldShowPlutoSwitch: UISwitch!
    
    @IBAction func changeShouldShowPluto(_ sender: UISwitch) {
        
        let userDefaults = UserDefaults.standard
        
//        userDefaults.set(sender.isOn, forKey: "ShouldShowPluto")
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    func updateViews() {
        let userDefaults = UserDefaults.standard
        
//        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: "ShouldShowPluto")
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
    
    // The key we use here is a string and since it's in "", if there is a typo we might not catch it and the compile won't complaint becuase it is a string
    // We should make a variable to hold on to the key string just to make sure we don't make any typo
}
