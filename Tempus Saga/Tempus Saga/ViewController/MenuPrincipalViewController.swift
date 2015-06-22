//
//  MenuPrincipalViewController.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/20/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit
import AVFoundation

class MenuPrincipalViewController: UIViewController {

    var intro = AVAudioPlayer()
    let sound = Sound()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intro = sound.setupAudioPlayerWithFile("RiseOfSpirit", type: "mp3")
        intro.play()
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        intro.stop()
    }

}
