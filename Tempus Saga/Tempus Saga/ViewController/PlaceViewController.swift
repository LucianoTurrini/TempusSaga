//
//  PlaceViewController.swift
//  Tempus Saga
//
//  Created by Jorge Henrique P. Garcia on 5/19/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit
import AVFoundation

class PlaceViewController: UIViewController {
    
    var music = AVAudioPlayer()
    let sound = Sound()
    
    // MARK: Outlets in StoryBoard
    
    @IBOutlet weak var labelTexto: UILabel!
    
    @IBOutlet weak var imgPersonagem: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var speakBackground: UIImageView!
    
    @IBOutlet weak var btResp1: UIButton!
    @IBOutlet weak var btResp2: UIButton!
    @IBOutlet weak var btResp3: UIButton!
    
    @IBOutlet weak var btCidadao1: UIButton!
    @IBOutlet weak var btCidadao2: UIButton!
    @IBOutlet weak var btCidadao3: UIButton!
    
    @IBOutlet weak var imgResp: UIImageView!
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
        
        btCidadao1.layer.borderColor = UIColor.whiteColor().CGColor
        btCidadao1.layer.borderWidth = 1.5
        btCidadao1.layer.cornerRadius = 6
        
        btCidadao2.layer.borderColor = UIColor.whiteColor().CGColor
        btCidadao2.layer.borderWidth = 1.5
        btCidadao2.layer.cornerRadius = 6
        
        btCidadao3.layer.borderColor = UIColor.whiteColor().CGColor
        btCidadao3.layer.borderWidth = 1.5
        btCidadao3.layer.cornerRadius = 6
        
        btResp1.layer.borderColor = UIColor.whiteColor().CGColor
        btResp1.layer.borderWidth = 1.5
        btResp1.layer.cornerRadius = 6
        
        btResp2.layer.borderColor = UIColor.whiteColor().CGColor
        btResp2.layer.borderWidth = 1.5
        btResp2.layer.cornerRadius = 6
        
        btResp3.layer.borderColor = UIColor.whiteColor().CGColor
        btResp3.layer.borderWidth = 1.5
        btResp3.layer.cornerRadius = 6
    
        
        music = sound.setupAudioPlayerWithFile("TheInnerSanctum", type: "mp3")
        music.play()
//        // NPC inicial (1) (troca depois no botão)
//        let npc = place.personagens["NPC1"]!
//        falas = npc.falas
        backgroundImage = UIImage(named: place.imageBackground!)
//        ///////////////////////
        
        NPC3 = place.perguntador
        
//        
//        imgPersonagem.image = personagem
        background.image = backgroundImage
//        speakBackground.image = backgroundSpeak
//        
//        labelTexto.text = ""
//        
//        Animations.slide(imgPersonagem, direction: Animations.direction.toRight)
//        
//        Animations.bubble(speakBackground, viewHeight: view.frame.width) { }
//        
//        Animations.bubble(labelTexto, viewHeight: view.frame.width) {
//            self.falar()
//        }
        
//        Animations.continuar = false    // Provável Skip
//        labelTexto.text = ""    // Limpar speak label
//        let npc = place.personagens["NPC1"]!
//        falas = npc.falas
//        falar()

    }
    
    
    func falar(){
        var numDialogo = 0
//        let dd = self.falas.count as! useconds_t
        usleep(1000 * 1000)  // Milisegundos * 1000     -- REVER na refatoração
        Animations.continuar = true
        
        while numDialogo < self.falas.count {  // Lembrar: Aqui é totalmente assíncrono!
            
            let fala = self.falas[numDialogo]
            
            if let img = fala.imagem {
                self.imgPersonagem.image = UIImage(named: img)
//                Animations.slide(self.imgPersonagem, direction: Animations.direction.toRight)
            }
            
            //Exibe o loop de diálogos
            if numDialogo < self.falas.count {
                
                self.animations.mostrarDialogoSimples(fala, img: self.imgPersonagem, label: self.labelTexto) { }
                //Depois do diálogo
                
            }
            numDialogo++
            
        }
    }
    
    
    // MARK: NPC Buttons
    
    @IBAction func btNPC1(sender: AnyObject) {
        
        Animations.continuar = false    // Provável Skip
        labelTexto.text = ""    // Limpar speak label
        
        // Exibe os botões de alternativas
        let viewWidth = view.frame.size.width
        labelTexto.frame.size.width = viewWidth
        btResp1.hidden = true
        btResp2.hidden = true
        btResp3.hidden = true
        imgResp.hidden = true
        
        let npc = place.personagens["NPC1"]!
        falas = npc.falas
        falar()
    }
    
    @IBAction func btNPC2(sender: AnyObject) {
        
        Animations.continuar = false    // Provável Skip
        labelTexto.text = ""    // Limpar speak label
        
        // Exibe os botões de alternativas
        let viewWidth = view.frame.size.width
        labelTexto.frame.size.width = viewWidth
        btResp1.hidden = true
        btResp2.hidden = true
        btResp3.hidden = true
        imgResp.hidden = true
        
        let npc = place.personagens["NPC2"]!
        falas = npc.falas
        falar()
    }

    @IBAction func buttonCancelar(sender: AnyObject) {
        music.stop()
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func btNPC3(sender: AnyObject) {      //TENTAR USAR NSOPERATION DEPOIS ao invés do dispatch_
        
        // Limpar queue aqui
//        let queueSpeak = Animations.queue
//        dispatch_resume(Animations.queue)
        
        Animations.continuar = false    // Provável Skip
        
        
        
//        delete(Animations.queue)
//        Animations.queue = dispatch_queue_create("com.tempusSaga.speak", DISPATCH_QUEUE_SERIAL)
//        Animations.queue
        
        labelTexto.text = ""    // Limpar speak label
        
        
        // Exibe os botões de alternativas
        let viewWidth = view.frame.size.width
        //labelTexto.frame.size.width = 100
        labelTexto.frame.size.width = viewWidth
        
        btResp1.hidden = false
        btResp2.hidden = false
        btResp3.hidden = false
        imgResp.hidden = false
        
//        NPC3 = JSONReader.getPerguntasJogo("personagem3")   // Teste; Vai vir pela segue - tirar depois
        
        btResp1.setTitle(NPC3?.perguntas[0].respostas[0].resposta, forState: UIControlState.Normal)
        btResp2.setTitle(NPC3?.perguntas[0].respostas[1].resposta, forState: UIControlState.Normal)
        btResp3.setTitle(NPC3?.perguntas[0].respostas[2].resposta, forState: UIControlState.Normal)
        
        //Define array de falas
        let falaTemp = Fala()
        falaTemp.fala = NPC3?.perguntas[0].pergunta
        
        
        if let img = NPC3?.imagem {
            falaTemp.imagem = img
        }
        
        let arrayFalaTemp = [falaTemp]
        
        //Define array para o método falar() conseguir ler
        falas = arrayFalaTemp
        
        
//        for i=0 in self.falas.count {}
        
        falar()
        
    }
    
    
    // MARK: Botões de resposta
    
    @IBAction func btResp1(sender: AnyObject) {
        
//        let viewWidth = view.frame.size.width
//        labelTexto.frame.size.width = 100
        
        // Limpar queue aqui
        Animations.continuar = false    // Provável Skip
        
        //Define array de falas
        let falaTemp = Fala()
        falaTemp.fala = NPC3?.perguntas[0].respostas[0].replica
        let arrayFalaTemp = [falaTemp]
        
        //Define array para o método falar() conseguir ler
        falas = arrayFalaTemp
        falar()
    }
    
    @IBAction func btResp2(sender: AnyObject) {
        
        // Limpar queue aqui
        Animations.continuar = false    // Provável Skip
        
        //Define array de falas
        let falaTemp = Fala()
        falaTemp.fala = NPC3?.perguntas[0].respostas[1].replica
        let arrayFalaTemp = [falaTemp]
        
        //Define array para o método falar() conseguir ler
        falas = arrayFalaTemp
        falar()
    }
    
    @IBAction func btResp3(sender: AnyObject) {
        
        // Limpar queue aqui
        Animations.continuar = false    // Provável Skip
        
        //Define array de falas
        let falaTemp = Fala()
        falaTemp.fala = NPC3?.perguntas[0].respostas[2].replica
        falaTemp.imagem = NPC3?.imagem  //Temporário
        let arrayFalaTemp = [falaTemp]
        
        //Define array para o método falar() conseguir ler
        falas = arrayFalaTemp
        falar()
        
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
