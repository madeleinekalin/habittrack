//
//  DeedsSettingViewController.swift
//  Habittrack prototype
//
//  Created by Madeleine Kalin on 2018-12-05.
//  Copyright © 2018 Madeleine Kalin. All rights reserved.
//

import UIKit

class DeedsSettingViewController: UIViewController {

    @IBOutlet weak var labelTimes: UILabel!
    
    @IBOutlet weak var lableTenTimes: UILabel!
    
    @IBOutlet weak var oneTimeSwitch: UISwitch!
    
    @IBOutlet weak var reminderSwitch: UISwitch!
  
    @IBOutlet weak var lableTimePicker: UILabel!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var labelMessage: UILabel!
    
    @IBOutlet weak var labelPeter: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
    hideOrShowTimes(hide: true)
    hideOrShowMessages(hide: true)
    reminderSwitch.isOn = false
    oneTimeSwitch.isOn = false
        
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
}

   
    
    @IBAction func TimesSwitch(_ sender: UISwitch) {
        
        if sender.isOn {
           hideOrShowTimes(hide: false)
            
        }
        else {
            hideOrShowTimes(hide: true)
        }
        print("in switch 1")
    }
    
    @IBAction func switchMessage(_ sender: UISwitch) {
        
        if sender.isOn {
            hideOrShowMessages(hide: false)
            
        }
        else {
           hideOrShowMessages(hide: true)
        }
        
    }
    
    func hideOrShowTimes(hide: Bool) {
        labelTimes.isHidden = hide
        lableTenTimes.isHidden = hide
    }
    
    func hideOrShowMessages(hide: Bool) {
        timePicker.isHidden  = hide
        labelMessage.isHidden = hide
        labelPeter.isHidden = hide
        lableTimePicker.isHidden = hide
    }
    


}
