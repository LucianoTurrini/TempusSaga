//
//  StageViewController.swift
//  Tempus Saga
//
//  Created by Sidney Silva on 5/14/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class StageViewController: UIViewController {

 
    // MARK: - Outlets in StoryBoard
    
    @IBOutlet weak var buttonStage1: UIButton!
    
    @IBOutlet weak var buttonStage2: UIButton!
    
    @IBOutlet weak var buttonStage3: UIButton!
    
    @IBOutlet weak var imageBackground: UIImageView!
    
    
    // MARK: - Global Variables
    
    var era: Era!
    
    var place = Place()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        defineStage()

        
    }
    
    
    func defineStage() {
        
        buttonStage1.setTitle(era.places[0].nome, forState: UIControlState.Normal)
        
        buttonStage2.setTitle(era.places[1].nome, forState: UIControlState.Normal)
        
        buttonStage3.setTitle(era.places[2].nome, forState: UIControlState.Normal)
        
        imageBackground.image = era.imageBackground
        
    }
    
    
    // MARK: - Buttons Actions
    
    @IBAction func buttonStage1(sender: UIButton) {
        
    }
    
    @IBAction func buttonStage2(sender: UIButton) {
        
    }
    
    @IBAction func buttonStage3(sender: UIButton) {
        
    }

    @IBAction func buttonVoltar(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
  
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
    }

}
