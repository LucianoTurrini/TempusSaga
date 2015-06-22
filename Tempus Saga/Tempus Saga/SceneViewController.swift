//
//  SceneViewController.swift
//  Tempus Saga
//
//  Created by Sidney Silva on 5/14/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit
import AVFoundation

class SceneViewController: UIViewController {

    let sound = Sound()
    var bgMusic = AVAudioPlayer()
    // MARK - Outlets in StoryBoard
    
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var labelSpeak: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var imageCharacter2: UIImageView!
    @IBOutlet weak var imageSpeakBackground: UIImageView!
    @IBOutlet weak var imageBackground: UIImageView!
    
    /// Teste - PEGAR AQUI A HISTÓRIA CORRESPONDENTE
    var historia = JSONReader.getFalasHistoria("historia1")
    
    var personagem1: UIImage?
    var personagem2: UIImage?
    var background: UIImage?
    var backgroundSpeak: UIImage?
    let animations = Animations()
    var falas: Array<Fala>!
    
    //private var numDialogo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        falas = historia.falas
        
        imageCharacter.image = personagem1
        imageCharacter2.image = personagem2
        imageBackground.image = UIImage(named: "imageHistoria")
        imageSpeakBackground.image = backgroundSpeak
        
        bgMusic = sound.setupAudioPlayerWithFile("calmBmg", type: "mp3")
        bgMusic.play()
        
        labelSpeak.text = ""
        
        Animations.slide(imageCharacter, direction: Animations.direction.toRight)
        Animations.slide(imageCharacter2, direction: Animations.direction.toLeft)
        
        Animations.bubble(imageSpeakBackground, viewHeight: view.frame.width) { }
        
        Animations.bubble(labelSpeak, viewHeight: view.frame.width){
            self.falar()
            
            // Quando acabar a cena escurece tudo
    
            Animations.fadeToBlack(self.view){
                
                //Fim da cena aqui
                
                Animations.continuar = false
                self.performSegueWithIdentifier("history", sender: self)
            }
        }
    }
    
    
    func falar() {
        
        var numDialogo = 0
        
        while numDialogo < falas.count {  // Lembrar: Aqui é totalmente assíncrono!
            
            let fala = self.falas[numDialogo]
            
            if let img = fala.imagem {
                if fala.personagem == "1" {
                    imageCharacter.image = UIImage(named: img)
                } else if fala.personagem == "2" {
                    imageCharacter2.image = UIImage(named: img)
                }
            }
            
            //Exibe o loop de diálogos
            if numDialogo < self.falas.count {
                
                self.animations.mostrarDialogo(fala, img1: self.imageCharacter, img2: self.imageCharacter2, label: self.labelSpeak){ }
                
                //Depois do diálogo
                numDialogo++
            }
        }
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        bgMusic.stop()
    }
    
    
    
//    func removerPersonagens(p1: UIImageView, p2: UIImageView) {
//        
//        Animations.slideOut(p1, direction: Animations.direction.toLeft)
//        Animations.slideOut(p2, direction: Animations.direction.toRight)
//        
//    }
    
    
    
    
    
    
    
    @IBAction func butttonPular(sender: UIButton) {
        Animations.continuar = false
        performSegueWithIdentifier("history", sender: self)
    }
    
    
    
    
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




