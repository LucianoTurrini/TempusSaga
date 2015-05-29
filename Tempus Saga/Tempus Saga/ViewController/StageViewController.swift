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
        
        selectStage()

        
    }
    
    /// Função que define os titulos dos botões e a imagem de fundo
    func selectStage() {
        
//        UIView.animateWithDuration(200.0, animations: {
//            self.buttonStage1.transform = CGAffineTransformMakeRotation((180.0 * CGFloat(M_PI)) / 180.0)
//        })
        
        //buttonStage1.setImage(UIImage(named: "imageButton"), forState: .Normal)
        
        buttonStage1.setBackgroundImage(UIImage(named: "teste"), forState: UIControlState.Normal)
        
        //buttonStage1.setTitle(era.places[0].nome, forState: UIControlState.Normal)
        
        //buttonStage2.setTitle(era.places[1].nome, forState: UIControlState.Normal)
        
        //buttonStage3.setTitle(era.places[2].nome, forState: UIControlState.Normal)
        
        //imageBackground.image = UIImage(named: era.imageBackground!)
        
    }
    
    
    // MARK: - Buttons Actions
    
    @IBAction func buttonStage1(sender: UIButton) {
        
        place = era.places[0]
        performSegueWithIdentifier("selecionarPlace", sender: self)
        
    }
    
    @IBAction func buttonStage2(sender: UIButton) {
        
        place = era.places[1]
        performSegueWithIdentifier("selecionarPlace", sender: self)
    
    }
    
    @IBAction func buttonStage3(sender: UIButton) {
    
        place = era.places[2]
        performSegueWithIdentifier("selecionarPlace", sender: self)
        
    }

    @IBAction func buttonVoltar(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
  
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "selecionarPlace" {
            
            let destination = segue.destinationViewController as! PlaceViewController
            
            destination.place = place
            
        }
        
        
    }

}
