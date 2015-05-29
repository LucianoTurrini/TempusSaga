//
//  Personagem.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/14/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit
//import Foundation
//import CoreData
//
//class Personagem: NSManagedObject {
//
//    @NSManaged var nome: String
//    @NSManaged var era: String
//    @NSManaged var texto: String
//    @NSManaged var estado: Bool
//
//}


class NPC: NSObject {

    var nome: String?
    var era: String?
    var place: String?
    var falas = Array<Fala>()
    var estado: Bool = false
    var image: UIImage?
}


/// Igual o NPC, mas possui o atributo "perguntas"
class Perguntador: NPC {
    
    var perguntas = Array<Pergunta>()
    var msgSucesso: String?
    var imagem: String?
    var desafio: Bool?
}




