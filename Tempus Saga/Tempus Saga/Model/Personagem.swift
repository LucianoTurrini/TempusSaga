//
//  Personagem.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/14/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import Foundation
import CoreData

class Personagem: NSManagedObject {

    @NSManaged var nome: String
    @NSManaged var era: String
    @NSManaged var texto: String
    @NSManaged var estado: NSNumber

}
