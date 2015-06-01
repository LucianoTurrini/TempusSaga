//
//  OracleViewController.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/29/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class OracleViewController: UIViewController {

    
    
    // MARK: Outlets in StoryBoard\
    
    @IBOutlet weak var labelTexto: UILabel!
    
    @IBOutlet weak var imgPersonagem: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var speakBackground: UIImageView!
    
    @IBOutlet weak var btResp1: UIButton!
    @IBOutlet weak var btResp2: UIButton!
    @IBOutlet weak var btResp3: UIButton!
    
    /// Teste - PEGAR AQUI O PLACE CORRESPONDENTE
    var place = Place()
    //////
    
    var personagem: UIImage?
    var backgroundImage: UIImage?
    var backgroundSpeak: UIImage?
    let animations = Animations()
    //var falas: Array<Fala>!
    var perguntas: Array<Pergunta>! // Segue here
    var oraculo = JSONReader.getPerguntasJogo("oraculo")
    var perguntaAtual: Pergunta!
    var perguntaCounter = 0
    var respostasCertas = 0
    
    // Mark: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Animations.continuar = false    // Provável Skip
        
        labelTexto.text = ""    // Limpar speak label
        
        btResp1.hidden = false
        btResp2.hidden = false
        btResp3.hidden = false
        

        self.perguntaAtual = oraculo.perguntas[perguntaCounter]
        
        btResp1.setTitle(perguntaAtual.respostas[0].resposta, forState: UIControlState.Normal)
        btResp2.setTitle(perguntaAtual.respostas[1].resposta, forState: UIControlState.Normal)
        btResp3.setTitle(perguntaAtual.respostas[2].resposta, forState: UIControlState.Normal)
        
        
        //        for i=0 in self.falas.count {}
        
        falar()
        
        
    }
    
    func falar(){
        var numDialogo = 0
        
        usleep(1000 * 1000)  // Milisegundos * 1000     -- REVER na refatoração
        Animations.continuar = true
        
        while numDialogo < self.perguntas.count {  // Lembrar: Aqui é totalmente assíncrono!
            
            let pergunta = perguntas[numDialogo]
            
            if let img = oraculo.imagem {
                imgPersonagem.image = UIImage(named: img)
                Animations.slide(imgPersonagem, direction: Animations.direction.toRight)
            }
            
            pergunta.fala = pergunta.pergunta   //Para igualar e mandar para o método seguinte
            //Exibe o loop de diálogos
            if numDialogo < self.perguntas.count {
                
                self.animations.mostrarDialogoSimples(pergunta, img: self.imgPersonagem, label: self.labelTexto) { }
                //Depois do diálogo
                
            } else {
                
                self.animations.mostrarDialogoSimples(pergunta, img: self.imgPersonagem, label: self.labelTexto) {
                    
                    Animations.fadeToBlack(self.view, completion: {})
                    //Animations.bubble(self.labelSpeak, completion: {})
                }
                
                // Implementar o fim da cena aqui
                
                // ->->->->->->->-  Trocar de cena aqui -------------------
            }
            numDialogo++
        }
    }

    func responder(numResposta: Int) {
        
        
        // Errado ou certo, vai exibir a mensagem correspondente
        perguntaAtual.fala = perguntaAtual.respostas[numResposta].replica
        falar()
        
        if perguntaAtual.respostas[numResposta].correto! {  //Se responder certo
            
            respostasCertas++
            
            if perguntaCounter < oraculo.perguntas.count {
                //Respondeu certo
                perguntaCounter++
                self.perguntaAtual = oraculo.perguntas[perguntaCounter]
                
                if respostasCertas >= oraculo.perguntas.count { // Respondeu todas certas
                    perguntaAtual.fala = oraculo.msgSucesso
                    falar()
                }
            } else {
                println("bug?") //Se n aparecer nunca, tirar
            }
            
        } else {    // Se resposta errada
            
            Animations.enfileirar(){    //Para manter o sincronismo de conversa
                
                // Colocar aqui o comando para voltar pra a outra view
                
            }
        }
        
        
        
        
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
