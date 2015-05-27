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
    
    @IBOutlet weak var btResp1: UIButton!
    @IBOutlet weak var btResp2: UIButton!
    @IBOutlet weak var btResp3: UIButton!
    
    
    //MARK: Global Variables
    
    /// Teste - PEGAR AQUI O PLACE CORRESPONDENTE
    var place = Place()
    //////
    
    var personagem: UIImage?
    var backgroundImage: UIImage?
    var backgroundSpeak: UIImage?
    let animations = Animations()
    var falas: Array<Fala>!
    var NPC3: Perguntador?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NPC inicial (1) (troca depois no botão)
        let npc = place.personagens["NPC1"]!
        falas = npc.falas
        
        imgPersonagem.image = personagem
        background.image = backgroundImage
        speakBackground.image = backgroundSpeak
        
        labelTexto.text = ""
        
        Animations.slide(imgPersonagem, direction: Animations.direction.toRight)
        
        Animations.bubble(speakBackground, viewHeight: view.frame.width){ }
        
        Animations.bubble(labelTexto, viewHeight: view.frame.width) {
            self.falar()
        }
    }
    
    func falar(){
        var numDialogo = 0
        
        while numDialogo < self.falas.count {  // Lembrar: Aqui é totalmente assíncrono!
            
            let fala = falas[numDialogo]
            
            if let img = fala.imagem {
                imgPersonagem.image = UIImage(named: img)
            }
            
            //Exibe o loop de diálogos
            if numDialogo < self.falas.count {
                
                self.animations.mostrarDialogoSimples(fala, img: self.imgPersonagem, label: self.labelTexto) { }
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
    
    
    // MARK: NPC Buttons
    
    @IBAction func btNPC1(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func btNPC2(sender: AnyObject) {
        
        
        
    }

    
    
    @IBAction func btNPC3(sender: AnyObject) {
        
        // Exibe as alternativas
        let labelWidth = labelTexto.frame.size.width
        labelTexto.frame.size.width = labelWidth/2
        btResp1.hidden = false
        btResp2.hidden = false
        btResp3.hidden = false
        
        NPC3 = JSONReader.getPerguntasJogo("personagem3")   // Teste; Vai vir pela segue - tirar depois
    }
    
    
    // MARK: Botões de resposta
    
    @IBAction func btResp1(sender: AnyObject) {
        
        
        
        
    }
    
    @IBAction func btResp2(sender: AnyObject) {
        
        
        
    }
    
    @IBAction func btResp3(sender: AnyObject) {
        
        
        
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
