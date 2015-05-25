//
//  PlaceViewController.swift
//  Tempus Saga
//
//  Created by Jorge Henrique P. Garcia on 5/19/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController {
    
    
    // MARK - Outlets in StoryBoard\
    
//    @IBOutlet weak var labelTexto: UILabel!
    @IBOutlet weak var labelTexto: UILabel!
    @IBOutlet weak var imgPersonagem: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var speakBackground: UIImageView!
    
    
    //MARK - Global Variables
    
    /// Teste - PEGAR AQUI O PLACE CORRESPONDENTE
    var place = Place()
    var personagem: UIImage?
    var backgroundImage: UIImage?
    //var backgroundSpeak: UIImage?
    let animations = Animations()
    var falas: Array<Fala>!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NPC inicial (1) (troca depois no botão)
        let npc = place.personagens.valueForKey("NPC1") as! NPC
        falas = npc.fala
        
        imgPersonagem.image = personagem
        background.image = backgroundImage
        //imageSpeakBackground.image = backgroundSpeak
        
        labelTexto.text = ""
        
        Animations.slide(imgPersonagem, direction: Animations.direction.toRight)
        
        //Animations.bubble(speakBackground){ }
        
        //Animations.bubble(labelTexto){
            self.falar()
        //}
    }
    
    func falar(){
        var numDialogo = 0
        
        while numDialogo < self.falas.count {  // Lembrar: Aqui é totalmente assíncrono!
            
            let fala = falas[numDialogo] //Fala()
//            fala.fala = self.falas[numDialogo]
//            fala.imagem =
            
            //Exibe o loop de diálogos
            if numDialogo < self.falas.count {
                
                self.animations.mostrarDialogoSimples(fala, img: self.imgPersonagem, label: self.labelTexto) { }
                //self.animations.mostrarDialogo(fala, img1: self.imgPersonagem, img2: self.imgPersonagem, label: self.labelTexto) { }
                //Depois do diálogo
                
            } else {
                
                self.animations.mostrarDialogoSimples(fala, img: self.imgPersonagem, label: self.labelTexto) {
                    
                    Animations.fadeToBlack(self.view)
                    //Animations.bubble(self.labelSpeak, completion: {})
                }
                
                // Implementar o fim da cena aqui
                
                // ->->->->->->->-  Trocar de cena aqui -------------------
            }
            numDialogo++
        }
    }
    
    
    // MARK - Buttons Actions
    
    @IBAction func btNPC1(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func btNPC2(sender: AnyObject) {
        
        
        
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
