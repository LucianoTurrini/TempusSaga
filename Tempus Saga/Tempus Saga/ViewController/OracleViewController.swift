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
    var perguntas: Array<Pergunta>!
//    var oraculo = JSONReader.getPerguntasJogo("oraculo")    //Passado pela Segue
    var oraculo: Perguntador!    //Passado pela Segue
    var perguntaAtual: Pergunta!
    var perguntaCounter = 0
    var respostasCertas = 0
    
    // Mark: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Animations.continuar = false    // Provável Skip
        
        labelTexto.text = ""    // Limpar speak label

        self.perguntaAtual = oraculo.perguntas[perguntaCounter]   //Pergunta inicial
        
        btResp1.hidden = false
        btResp1.setTitle(perguntaAtual.respostas[0].resposta, forState: UIControlState.Normal)
        
        btResp2.hidden = false
        btResp2.setTitle(perguntaAtual.respostas[1].resposta, forState: UIControlState.Normal)
        
        if perguntaAtual.respostas.count > 2  {
            btResp3.setTitle(perguntaAtual.respostas[2].resposta, forState: UIControlState.Normal)
        } else {
            btResp3.hidden = true
        }
        
        
        //        for i=0 in self.falas.count {}
        
        Animations.continuar = false    // Provável Skip
        labelTexto.text = ""    // Limpar speak label
        //let npc = place.personagens["oraculo"]!
        perguntas = oraculo.perguntas
        
        falar(perguntaAtual)
        
        
    }
    
    func falar(pergunta: Pergunta){
        //var numDialogo = 0
        
        usleep(1000 * 1000)  // Milisegundos * 1000     -- REVER na refatoração
        Animations.continuar = true
        
        //while numDialogo < self.perguntas.count {  // Lembrar: Aqui é totalmente assíncrono!
            
        //let pergunta = perguntas[numPergunta]   //Tirar essa linha?
        
        if let img = oraculo.imagem {
            imgPersonagem.image = UIImage(named: img)
            Animations.slide(imgPersonagem, direction: Animations.direction.toRight)
        }
        
        pergunta.fala = perguntaAtual.pergunta   //Para igualar e mandar para o método seguinte
        //Exibe o loop de diálogos
        //if numPergunta < self.perguntas.count {
            
        self.animations.mostrarDialogoSimples(pergunta, img: self.imgPersonagem, label: self.labelTexto) { }
        //Depois do diálogo

    }

    func responder(numResposta: Int) {
        
        Animations.continuar = false
        
        // Errado ou certo, vai exibir a mensagem correspondente
        perguntaAtual.pergunta = perguntaAtual.respostas[numResposta].replica
        falar(perguntaAtual)
        
        if perguntaAtual.respostas[numResposta].correto! {  //Se responder certo
            
            respostasCertas++
            
            if perguntaCounter < oraculo.perguntas.count {
                //Respondeu certo
                
                if respostasCertas >= oraculo.perguntas.count+1 { // Respondeu todas certas (incluindo a primeira de continuar)
                    perguntaAtual.pergunta = oraculo.msgSucesso
                    falar(perguntaAtual)
                    
                    // SUCESSO AQUI - TROCAR DE TELA
                    
                } else {
                    //Próxima pergunta
                    perguntaCounter++
                    self.perguntaAtual = oraculo.perguntas[perguntaCounter]
                    btResp1.setTitle(perguntaAtual.respostas[0].resposta, forState: UIControlState.Normal)
                    btResp2.setTitle(perguntaAtual.respostas[1].resposta, forState: UIControlState.Normal)
                    btResp3.setTitle(perguntaAtual.respostas[2].resposta, forState: UIControlState.Normal)
                    
                    falar(perguntaAtual)
                    
                }
                println("Resposta certa")
                respostasCertas++
                
            } else {
                println("bug?") //Se n aparecer nunca, tirar
            }
            
        } else {    // Se resposta errada
            
            Animations.fadeToBlack(self.view){
                
                // Trocar aqui de tela para voltar
                // Colocar aqui o comando para voltar pra a outra view (resp errada)
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            
            println("Resposta errada")
        }
        
    }
    
    
    @IBAction func btResp1(sender: AnyObject) {
        responder(0)
    }
    
    @IBAction func btResp2(sender: AnyObject) {
        responder(1)
    }
    
    @IBAction func btResp3(sender: AnyObject) {
        responder(2)
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
