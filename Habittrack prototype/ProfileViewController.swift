//
//  profileviewcontroller.swift
//  Habittrack prototype
//
//  Created by Madeleine Kalin on 2018-12-06.
//  Copyright © 2018 Madeleine Kalin. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
  @IBOutlet weak var pageControll: UIPageControl!
    
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
      
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imageView.image = UIImage(named: "profile1")
        
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imageView.image = UIImage(named: "profile2")
        
        
       
        
        return [slide1, slide2]
    }
    
    
    func setupSlideScrollView(slides : [Slide]) {
       //scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
      scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 505)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
          slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
}
