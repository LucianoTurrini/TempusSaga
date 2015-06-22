//
//  Era.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/18/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class Era {
    
    var nome: String!
    var places: Array<Place>!
    var imageBackground: String?
    var botao1: String?
    var botao2: String?
    var botao3: String?
    var botao4: String?
    
    convenience init(nome: String, places: Array<Place>, imageBackground: String) {
        self.init()
        
        self.nome = nome
        self.places = places
        self.imageBackground = imageBackground
    }

   
}
