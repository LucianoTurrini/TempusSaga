//
//  AgesViewController.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/18/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit
import AVFoundation

class AgesViewController: UIViewController {
    
   
    // MARK: - Buttons Outlets
    
    @IBOutlet weak var buttonGrecia: UIButton!
    @IBOutlet weak var buttonEgito: UIButton!
    @IBOutlet weak var buttonReinoUnido: UIButton!
    
    
    // MARK: - Global Variables
    
    var era = Era()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Buttons Actions
    
    @IBAction func buttonEgito(sender: AnyObject) {
        
        era = JSONReader.getFalasJogo("Egito")
        performSegueWithIdentifier("selecionarEra", sender: self)
    }
    
    @IBAction func buttonGrecia(sender: AnyObject) {
        
        era = JSONReader.getFalasJogo("Grécia")
        performSegueWithIdentifier("selecionarEra", sender: self)
        
    }
    
    @IBAction func buttonReinoUnido(sender: AnyObject) {
        
        era = JSONReader.getFalasJogo("Reino Unido")
        
        performSegueWithIdentifier("selecionarEra", sender: self)
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if segue.identifier == "selecionarEra" {
            
            let destination = segue.destinationViewController as! StageViewController
            
            destination.era = self.era
            
        }

    }

}
