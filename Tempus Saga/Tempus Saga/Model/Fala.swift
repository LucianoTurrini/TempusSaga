//
//  Fala.swift
//  Tempus Saga
//
//  Created by Jorge Henrique P. Garcia on 5/26/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class Fala {
    
    var personagem = ""
    var fala: String!
    var imagem: String!
    
}

class Pergunta: Fala {
    
    var pergunta: String!
    var respostas = Array<Resposta>()
    
}

class Resposta {
    
    var resposta: String!
    var replica: String?
    var treplica: String?   // Não implementado
    var correto: Bool?
    
}



