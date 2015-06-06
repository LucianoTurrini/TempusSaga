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
    
    @IBOutlet weak var buttonStage4: UIButton!
    
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
        
        buttonStage1.setImage(UIImage(named: era.botao1!), forState: .Normal)
        
        buttonStage2.setImage(UIImage(named: era.botao2!), forState: .Normal)
        
        buttonStage3.setImage(UIImage(named: era.botao3!), forState: .Normal)
        
        buttonStage4.setImage(UIImage(named: era.botao4!), forState: .Normal)
        
        imageBackground.image = UIImage(named: era.imageBackground!)
        
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
    
    @IBAction func buttonStage4(sender: UIButton) {
        place = era.places[3]
        performSegueWithIdentifier("irOracle", sender: self)
        
    }

    @IBAction func buttonVoltar(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
  
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "selecionarPlace" {
            
            let destination = segue.destinationViewController as! PlaceViewController
            destination.place = place
            
        } else if segue.identifier == "irOracle" {
            
            let destination = segue.destinationViewController as! OracleViewController
            destination.oraculo = place.perguntador! //Testar
            
            
            
        }
        
        
    }

}
