//
//  AgesViewController.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/18/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class AgesViewController: UIViewController {
    
   
    // MARK: - Buttons Outlets
    
    @IBOutlet weak var buttonGrecia: UIButton!
    @IBOutlet weak var buttonEgito: UIButton!
    @IBOutlet weak var buttonReinoUnido: UIButton!
    
    
    // MARK: - Variables
    
    var era = Era()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    // MARK: - Buttons Actions
    
    @IBAction func buttonEgito(sender: AnyObject) {
        
        era.nome = "Egito"
        //era!.places = nil
        era.imageBackground = UIImage(named: "egitoBackground")!
        
        performSegueWithIdentifier("selecionarEra", sender: self)
        
    }
    
    @IBAction func buttonGrecia(sender: AnyObject) {
        
        era.nome = "Grécia"
        //era!.places = nil
        era.imageBackground = UIImage(named: "greciaBackground")!

        performSegueWithIdentifier("selecionarEra", sender: self)
        
    }
    
    @IBAction func buttonReinoUnido(sender: AnyObject) {
        
        era.nome = "Reino Unido"
        //era!.places = nil
        era.imageBackground = UIImage(named: "reinoUnidoBackground")!
        
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
