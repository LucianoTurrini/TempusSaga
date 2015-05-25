//
//  Perguntador.swift
//  Tempus Saga
//
//  Created by Jorge Henrique P. Garcia on 5/25/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class Perguntador: NPC {
   
    var perguntas = Array<Pergunta>()
    
}


class Pergunta: NSObject {
    
    var pergunta: String!
    var resposta: String!
    
}