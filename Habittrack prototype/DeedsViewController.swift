//
//  deedsViewController.swift
//  Habittrack prototype
//
//  Created by Madeleine Kalin on 2018-12-04.
//  Copyright © 2018 Madeleine Kalin. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation



class DeedsViewController: UIViewController {
    
   @IBOutlet weak var labelDoneDeed: UILabel!
    @IBOutlet weak var progressDeed: UIProgressView!
    @IBOutlet weak var deed: UIView!
    @IBOutlet weak var deed2: UIView!
    @IBOutlet weak var checkboxButton2: UIButton!
    @IBOutlet weak var checkboxButton: UIButton!
    var isChecked1 = false
    var isChecked2 = false
    var progress = 0.2
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var notificationNewDeeds: UIView!
    
    var firstTime = true
    
    @IBAction func checkbox(_ sender: Any) {
        
        if isChecked1 == false{
                  checkboxButton.setImage(UIImage(named: "icons8-tick-box-50.png"), for: .normal)
            isChecked1 = true
            progress = progress + 0.2
            progressDeed.setProgress(Float(progress), animated: true)
            playSound()
        
            
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2500)) {
                self.checkboxButton.setImage(UIImage(named: "icons8-unchecked-checkbox-50.png"), for: .normal)
                self.isChecked1 = false
            }
            
        }
        
  
    }
    
    @IBAction func checkbox2(_ sender: Any) {
        
        if isChecked2 == false{
            checkboxButton2.setImage(UIImage(named: "icons8-tick-box-50.png"), for: .normal)
            isChecked2 = true
            playSound()
        
            
            self.deed2.backgroundColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.0)
            UIView.animateKeyframes(withDuration: 1.5, delay: 0.5, options: UIView.KeyframeAnimationOptions(rawValue: 7), animations: {
                self.deed2.frame.origin.y+=310
                
            },completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(2000)) {
                
     
                
            }
            
       
            
        }
        
    }
    
    
    override func viewDidLoad() {
        deed.layer.cornerRadius = 10
        progressDeed.setProgress(Float(progress), animated: false)
        
        deed2.layer.cornerRadius = 10
        notificationNewDeeds.isHidden = true
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       

        if Int.random(in: 0 ... 10) % 2 == 0{
            notificationNewDeeds.layer.cornerRadius = 9
            notificationNewDeeds.isHidden = false
        }
            
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "note4", withExtension: "wav")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
   
}
