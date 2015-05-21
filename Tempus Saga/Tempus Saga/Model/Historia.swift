//
//  Historia.swift
//  Tempus Saga
//
//  Created by Jorge Henrique P. Garcia on 5/21/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit



class Historia: NSObject {
   
    var era: String!
    var place: String!
    var falas = Array<Fala>()
    
}

class Fala: NSObject {
    
    var personagem = ""
    var fala: String!
    var imagem: String!
    
}