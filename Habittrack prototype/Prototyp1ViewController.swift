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

class Prototyp1ViewController: UIViewController {
    
    var player: AVAudioPlayer?
    var times = 0
    
    @IBOutlet weak var timesLable: UILabel!
    @IBOutlet weak var timesDeeds: UIImageView!
    @IBOutlet weak var buttonHistory: UIButton!
    @IBOutlet weak var lableDeeds: UILabel!
    @IBOutlet weak var imageDeeds: UIImageView!
    @IBOutlet weak var buttonGotADeed: UIButton!
    
    
    @IBOutlet weak var buttonRight: UIButton!
    
    @IBOutlet weak var segmentControllerOutlet: UISegmentedControl!
    @IBOutlet weak var buttonDeed: UIButton!
    

    @IBAction func buttonInDeed(_ sender: UIButton) {
        if segmentControllerOutlet.selectedSegmentIndex == 0{
            setView(view: imageDeeds, hidden: true)
            
            lableDeeds.text = "Du har gjort klart alla dina deeds, bra jobbat! \n\n Fortsätt i klimatresan för att välja fler eller plocka upp en gammal goding från historiken"
           
            
            buttonDeed.isHidden = true
            buttonRight.isHidden = true
            playSound()
            
            buttonHistory.isHidden = false
        }
        else{
            times = times + 1
            timesLable.text = "\(times) gånger"
            playSound()
            
            
            //segmentControllOutlet.selectedSegmentIndex = 0
            //segmentControllOutlet.sendActions(for: UIControl.Event.valueChanged)
        }
    }
    
   
    
    @IBAction func buttonRightAction(_ sender: UIButton) {
        if segmentControllerOutlet.selectedSegmentIndex == 0{
            setView(view: imageDeeds, hidden: true)
            
            lableDeeds.text = "Du har inga deeds aktiva \n\n Fortsätt i klimatresan för att välja fler eller har du någon vana du kan göra?"
            
            
            buttonDeed.isHidden = true
            buttonRight.isHidden = true
            
        }
        else{
            setView(view: imageDeeds, hidden: true)
            
            lableDeeds.text = "Du har inga vanor aktiva. Under fliken Mina Deeds kan du välja att skapa vanor \n\n borttagna vanor finns i historiken"
            
            
            buttonDeed.isHidden = true
            buttonRight.isHidden = true
            timesDeeds.isHidden = true
            timesLable.isHidden = true
            
            buttonHistory.isHidden = false
            
        }
    }
    
    
    func setView(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 1.5, options: .transitionCrossDissolve, animations: {
            view.isHidden = hidden
        })
    }
    
    override func viewDidLoad() {
        
        
        buttonDeed.isHidden = true
        buttonRight.isHidden = true
        imageDeeds.isHidden = true
        buttonHistory.isHidden = true
        timesDeeds.isHidden = true
        timesLable.isHidden = true
        
        buttonDeed.backgroundColor = .clear
        buttonDeed.layer.cornerRadius = 20
        buttonDeed.layer.borderWidth = 1
        buttonDeed.layer.borderColor = UIColor.black.cgColor
        
        buttonRight.backgroundColor = .clear
        buttonRight.layer.cornerRadius = 20
        buttonRight.layer.borderWidth = 1
        buttonRight.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    @IBAction func gotADeed(_ sender: Any) {
        buttonGotADeed.isHidden = true
        buttonDeed.isHidden = false
        buttonRight.isHidden = false
        imageDeeds.isHidden = false
    }
    
    
    
    @IBAction func segmentControll(_ sender: UISegmentedControl) {
            imageDeeds.isHidden = false
            buttonDeed.isHidden = false
            buttonRight.isHidden = false
        
            switch sender.selectedSegmentIndex
            {
            case 0:
                buttonRight.setTitle("Gör till vana", for: .normal)
                timesDeeds.isHidden = true
                timesLable.isHidden = true
                
                
            case 1:
                buttonRight.setTitle("Ta bort", for: .normal)
                timesDeeds.isHidden = false
                timesLable.isHidden = false
                
                
                
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
    



