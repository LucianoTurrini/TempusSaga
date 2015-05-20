//
//  SceneViewController.swift
//  Tempus Saga
//
//  Created by Sidney Silva on 5/14/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var imageCharacter2: UIImageView!
    @IBOutlet weak var labelSpeak: UILabel!
    @IBOutlet weak var imageSpeakBackground: UIImageView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var buttonNext: UIButton!
    
    /// Matriz com texto e imagem opcional do tipo [String, String, String]
    // (Personagem, texto, imagem)
    var textAndImages = Array< [String] >()
//    var textAndImages: Array< [String?] >!
    var personagem1: UIImage?
    var personagem2: UIImage?
    var background: UIImage?
    var backgroundSpeak: UIImage?
    let animations = Animations()
    
    private var numDialogo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textAndImages = JSONReader.getFalas("teste")
        
        imageCharacter.image = personagem1
        imageCharacter2.image = personagem2
        imageBackground.image = background
        //imageSpeakBackground.image = backgroundSpeak
        
        labelSpeak.text = ""
        
        Animations.slide(imageCharacter, direction: Animations.direction.toRight)
        Animations.slide(imageCharacter2, direction: Animations.direction.toLeft)
        
        Animations.bubble(imageSpeakBackground){ }
        
        Animations.bubble(labelSpeak){
            
            while self.numDialogo < self.textAndImages.count {  // Lembrar: Aqui é totalmente assíncrono!

                //Exibe o loop de diálogos
                if self.numDialogo < self.textAndImages.count-1 {
                    self.animations.mostrarDialogo(self.textAndImages[self.numDialogo], img1: self.imageCharacter, img2: self.imageCharacter2, label: self.labelSpeak){ }
                } else {
                    //Depois do diálogo
                    self.animations.mostrarDialogo(self.textAndImages[self.numDialogo], img1: self.imageCharacter, img2: self.imageCharacter2, label: self.labelSpeak){
                        
                        Animations.fadeToBlack(self.view)
                        //Animations.bubble(self.labelSpeak, completion: {})
                        
                    }
                    
                    // Implementar o fim da cena aqui
                    
// ->->->->->->->-  Trocar de cena aqui -------------------
                    
                }
                
                // Incrementa o indice do vetor
                if self.numDialogo < self.textAndImages.count {
                    self.numDialogo++
                }
                
            }
        }
    }
    
    
//    func removerPersonagens(p1: UIImageView, p2: UIImageView) {
//        
//        Animations.slideOut(p1, direction: Animations.direction.toLeft)
//        Animations.slideOut(p2, direction: Animations.direction.toRight)
//        
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
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




