//
//  AgesViewController.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/18/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class AgesViewController: UIViewController {

    @IBOutlet weak var buttonGrecia: UIButton!
    @IBOutlet weak var buttonEgito: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // MARK: - Buttons Actions
    
    @IBAction func buttonEgito(sender: AnyObject) {
        
        performSegueWithIdentifier("selecionarEra", sender: self)
        
    }
    @IBAction func buttonGrecia(sender: AnyObject) {
        
        performSegueWithIdentifier("selecionarEra", sender: self)
        
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        
        
        
    }

}
