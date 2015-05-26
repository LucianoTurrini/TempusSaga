//
//  Fala.swift
//  Tempus Saga
//
//  Created by Jorge Henrique P. Garcia on 5/26/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class Fala: NSObject {
    
    var personagem = ""
    var fala: String!
    var imagem: String!
    
}

class Pergunta: NSObject {
    
    var pergunta: String!
    var resposta = Array<Resposta>()
    var respostaCerta: String?
    
}

class Resposta: NSObject {
    
    var resposta: String!
    var replica: String?
    var treplica: String?   // Não implementado
    
}



