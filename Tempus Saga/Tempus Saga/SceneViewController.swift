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
    var textAndImages = Array< [String?] >()
//    var textAndImages: Array< [String?] >!
    var personagem1: UIImage?
    var personagem2: UIImage?
    var background: UIImage?
    var backgroundSpeak: UIImage?
    let animations = Animations()
    
    private var numDialogo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
///// Teste ////////////
        let fala1:[String?] = ["1", "- Hey man! What's up?", ""]
        let fala2:[String?] = ["2", "- I'm ok.", ""]
        let fala3:[String?] = ["2", "- And you?", ""]
        let fala4:[String?] = ["1", "- Ok.", ""]
        let fala5:[String?] = ["1", "- ...", ""]
        let fala6:[String?] = ["2", "- ...", ""]
        let fala7:[String?] = ["1", "- Bye.", ""]
        let fala8:[String?] = ["2", "- Bye.", ""]
        textAndImages.append(fala1)
        textAndImages.append(fala2)
        textAndImages.append(fala3)
        textAndImages.append(fala4)
        textAndImages.append(fala5)
        textAndImages.append(fala6)
        textAndImages.append(fala7)
        textAndImages.append(fala8)
        
///// Teste ////////////
        

        imageCharacter.image = personagem1
        imageCharacter2.image = personagem2
        imageBackground.image = background
        //imageSpeakBackground.image = backgroundSpeak
        
        
        
        labelSpeak.text = ""
        
        Animations.bubble(imageSpeakBackground){ }
        
        Animations.bubble(labelSpeak){
            
            while self.numDialogo < self.textAndImages.count {
                self.mostrarDialogo()
                //Exibe o loop de diálogos
            }
        }
        
        Animations.slide(imageCharacter, direction: Animations.direction.toRight)
        Animations.slide(imageCharacter2, direction: Animations.direction.toLeft)
    }

    func mostrarDialogo(){
            
        let textImage = self.textAndImages[self.numDialogo]
        
        let personagem = textImage[0]!
        let texto = textImage[1]
    
        /// Pega a thread criada para o texto e adiciona
        let queue = animations.queue
    
        dispatch_async (queue, { () -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                if personagem == "1" {
                    // Personagem 1 em foco, 2 transparente
                    self.imageCharacter2.alpha = 0.4
                    self.imageCharacter.alpha = 1
                } else if personagem == "2" {
                    // Personagem 2 em foco, 1 transparente
                    self.imageCharacter.alpha = 0.4
                    self.imageCharacter2.alpha = 1
                }
            })
        })
        
        self.animations.input(texto!, label: self.labelSpeak) //Pega só o texto do Array
        
        // Pausa entre as falas
        dispatch_async (queue, { () -> Void in
            usleep(1000 * 1000)  // Milisegundos * 1000
        })
        
        // Incrementa o indice do vetor
        if self.numDialogo < self.textAndImages.count {
            self.numDialogo++
        }
        
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




