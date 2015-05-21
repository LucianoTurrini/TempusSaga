//
//  Era.swift
//  Tempus Saga
//
//  Created by Luciano Moreira Turrini on 5/18/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class Era: NSObject {
    
    var nome: String!
    var places: Array<Place>!
    var imageBackground: UIImage?
    
    convenience init(nome: String, places: Array<Place>, imageBackground: UIImage) {
        self.init()
        
        self.nome = nome
        self.places = places
        self.imageBackground = imageBackground
    }

   
}
