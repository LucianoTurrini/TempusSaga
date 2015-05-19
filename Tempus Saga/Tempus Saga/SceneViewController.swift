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
        
        Animations.bubble(imageSpeakBackground){ }
        
        Animations.bubble(labelSpeak){
            
            while self.numDialogo < self.textAndImages.count {  // Lembrar: Aqui é totalmente assíncrono!
                self.mostrarDialogo()
                //Exibe o loop de diálogos
            }
        }
        
        Animations.slide(imageCharacter, direction: Animations.direction.toRight)
        Animations.slide(imageCharacter2, direction: Animations.direction.toLeft)
    }

    func mostrarDialogo(){  // Totalmente assíncrono
            
        let textImage = self.textAndImages[self.numDialogo]
        
        let personagem = textImage[0]
        let texto = textImage[1]
        let imageString = textImage[2]
        var image = UIImage()
        let nDialogo = self.numDialogo
    
        /// Pega a thread criada para o texto e adiciona
        let queue = animations.queue
    
        dispatch_async (queue, { () -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                if let testImage = UIImage(named: imageString) {
                    image = testImage
                }
                
                if personagem == "1" {
                    // Personagem 1 em foco, 2 transparente
                    self.imageCharacter2.alpha = 0.4
                    self.imageCharacter.alpha = 1
                    self.imageCharacter.image = image
                } else if personagem == "2" {
                    // Personagem 2 em foco, 1 transparente
                    self.imageCharacter.alpha = 0.4
                    self.imageCharacter2.alpha = 1
                    self.imageCharacter2.image = image
                }
                
                // Verifica se acabou a fala
                if nDialogo >= self.textAndImages.count-1 {
                    self.removerPersonagens(self.imageCharacter, p2: self.imageCharacter2)
                }
            })
        })
        
        self.animations.input(texto, label: self.labelSpeak) //Pega só o texto do Array
        
        
        
        // Pausa entre as falas
        dispatch_async (queue, { () -> Void in
            usleep(500 * 1000)  // Milisegundos * 1000
        })
        
        // Incrementa o indice do vetor
        if self.numDialogo < self.textAndImages.count {
            self.numDialogo++
        }
        
    }
    
    
    func removerPersonagens(p1: UIImageView, p2: UIImageView) {
        
        Animations.slideOut(p1, direction: Animations.direction.toLeft)
        Animations.slideOut(p2, direction: Animations.direction.toRight)
        
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




