//
//  JSONReader.swift
//  Tempus Saga
//
//  Created by Jorge Henrique P. Garcia on 5/19/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class JSONReader: NSObject {
    
    
    /// Retorna os dados JSON de uma URL (String)
    private class func getJSONData (fileToRead: String) -> AnyObject? {
        
        let filePath = NSBundle.mainBundle().pathForResource(fileToRead, ofType:"json")
        var readError:NSError?
        /// Objeto de retorno
        var dic: AnyObject?
        
        if let data = NSData(contentsOfFile:filePath!, options:NSDataReadingOptions.DataReadingUncached, error:&readError) {
            
            var error: NSError?
            dic = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error)
        } else {
            println("Não foi possível ler o valor NSData da url passada")
        }
        return dic
    }
    
    /// Retorna o JSON em forma de NSDictionary à partir do nome do arquivo
    class func getJsonDic(fileToRead: String) -> NSDictionary{
        
        return getJSONData(fileToRead) as! NSDictionary
        
    }

    class func getFalasHistoria (IdHistoria: String) -> Historia {
    
        var historia = Historia()
        
        let jsonDic: NSDictionary = getJsonDic("historia")
        let arrayHistoria = jsonDic.objectForKey(IdHistoria) as! NSDictionary
        
        let era = arrayHistoria.objectForKey("era") as! String
        let place = arrayHistoria.objectForKey("place") as! String
        let arrayFalas = arrayHistoria.objectForKey("falas") as! Array <NSDictionary>
        
        for dicFala in arrayFalas {
            
            let personagem = dicFala.objectForKey("personagem") as! String
            let fala = dicFala.objectForKey("fala") as! String
            let imagem = dicFala.objectForKey("imagem") as! String
            
            let falaObj = Fala()
            falaObj.personagem = personagem
            falaObj.fala = fala
            falaObj.imagem = imagem
            
            historia.falas.append(falaObj)
        }
        
        historia.era = era
        historia.place = place
        
        return historia
    }
    


    class func getFalasJogo(nomeEra: String) -> Era{
        
        let jsonDic: NSDictionary = getJsonDic("game")
        var era = Era()
        
        let eraDic = jsonDic.objectForKey(nomeEra) as! NSDictionary
        
        era.nome = eraDic.objectForKey("nome") as! String
        era.imageBackground = eraDic.objectForKey("imageBackground") as? String
        
        var arrayPlaces = Array<Place>()
        
        let placesDic = eraDic.objectForKey("places") as! Array<NSDictionary>
        for p in placesDic {
            
            var place = Place()
            
            place.nome = p.objectForKey("nome") as! String
            place.imageBackground = p.objectForKey("imageBackground") as? String
            
            var personagens = Dictionary<String, NPC>()
            
            let npcDic = p.objectForKey("personagens") as! NSDictionary
            for (key, value) in npcDic {    // value: dentro do npc
                
                var npc = NPC()
                npc.nome = key as? String
                npc.era = era.nome
                npc.place = place.nome
                npc.image = UIImage(named: value.objectForKey("image") as! String)
                
                let arrayFala = value.objectForKey("falas") as! [String]
                
                for fala in arrayFala {
                    
                    let falaObj = Fala()
                    falaObj.fala = fala
                    falaObj.imagem = value.objectForKey("image") as! String
                    
                    npc.falas.append(falaObj)
                }
                
                //personagens.setValue(npc, forKeyPath: npc.nome!)
                
                personagens [npc.nome!] = npc
            }
            place.personagens = personagens     //Adiciona os personagens
            arrayPlaces.append(place)
        }
        era.places = arrayPlaces   //Adiciona os places
        
        return era
    }
    
    
    class func getPerguntasJogo(nomeNPC: String) -> Perguntador{
        
        var perguntador = Perguntador()
        
        let perguntadoresDic = getJsonDic("perguntador")
        let personagemDic = perguntadoresDic.objectForKey(nomeNPC) as! NSDictionary
        
        perguntador.nome = personagemDic.objectForKey("nome") as? String
        perguntador.era = personagemDic.objectForKey("era") as? String
        perguntador.place = personagemDic.objectForKey("place") as? String
        perguntador.imagem = personagemDic.objectForKey("imagem") as? String
        perguntador.desafio = personagemDic.objectForKey("desafio") as? Bool
        
        
        let perguntasArray = personagemDic.objectForKey("perguntas") as! Array<NSDictionary>
        for pergunta in perguntasArray {
            
            var p = Pergunta()
            p.pergunta = pergunta.objectForKey("pergunta") as! String
            //p.resposta = pergunta.objectForKey("resposta") as! String   //Trocar pra ler vetor de dic
            
            let respDic = pergunta.objectForKey("respostas") as! [Dictionary<String, String>]
            
            for resp in respDic {
                
                var r = Resposta()
                r.resposta = resp["resposta"]
                r.replica = resp["replica"]
                if let correto = resp["correto"] {
                    r.correto = NSString(string: correto).boolValue //Conversão para Bool
                }
                p.resposta.append(r)
            }
            
            perguntador.perguntas.append(p)
            perguntador.msgSucesso = personagemDic.objectForKey("sucesso") as? String
        }
        return perguntador
    }

    
    
    
    
    
    
    
    
    
}
