//
//  BasicViewController.swift
//  Habittrack prototype
//
//  Created by Madeleine Kalin on 2018-12-11.
//  Copyright © 2018 Madeleine Kalin. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

class BasicViewController: UIViewController {
    
 var player: AVAudioPlayer?
    
    @IBOutlet weak var buttonHistory: UIButton!
    @IBOutlet weak var lableDeeds: UILabel!
    
    @IBOutlet weak var ImageDeeds: UIImageView!
    
    @IBOutlet weak var segmentControllOutlet: UISegmentedControl!
    @IBOutlet weak var greyView2: UIView!
    @IBOutlet weak var greyView1: UIView!
    @IBOutlet weak var buttonDeed: UIButton!
    
    @IBAction func buttonInDeed(_ sender: Any) {
        if buttonDeed.currentTitle == "klar"{
            setView(view: ImageDeeds, hidden: true)

             lableDeeds.text = "Du har gjort klart alla dina deeds, bra jobbat!, välj någon ny från Alla Deeds"
      
            
            buttonDeed.isHidden = true
            playSound()
            
            buttonHistory.isHidden = false
        }
        else{
            ImageDeeds.image = UIImage(named: "deedBank")
           //segmentControllOutlet.selectedSegmentIndex = 0
            //segmentControllOutlet.sendActions(for: UIControl.Event.valueChanged)
        }
    }
    
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 1.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
    
    override func viewDidLoad() {
     
        greyView1.isHidden = true
        greyView2.isHidden = true
        buttonDeed.isHidden = true
        ImageDeeds.isHidden = true
        buttonHistory.isHidden = true
        
        
    }
    
    @IBAction func segmentControll(_ sender: UISegmentedControl) {
     ImageDeeds.isHidden = false
        buttonDeed.isHidden = false
        
        switch sender.selectedSegmentIndex
        {
        case 0:
            greyView1.isHidden = false
            greyView2.isHidden = false
            buttonDeed.setTitle("klar", for: .normal)
            print("test0")
            ImageDeeds.image = UIImage(named: "deedMy")

           
        case 1:
            buttonDeed.setTitle("välj", for: .normal)
            greyView1.isHidden = true
            greyView2.isHidden = true
            print("test1")

           
        default:
            break
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
    

