//
//  JSONReader.swift
//  Tempus Saga
//
//  Created by Jorge Henrique P. Garcia on 5/19/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class JSONReader: NSObject {
   
    
    class func getFalas (arquivo: String) -> Array<[String]> {
    
        var textAndImages = Array<[String]>()
        
        ///// Teste ////////////
        let fala1:[String] = ["1", "- Hey man! What's up?", ""]
        let fala2:[String] = ["2", "- I'm ok.", ""]
        let fala3:[String] = ["2", "- And you?", ""]
        let fala4:[String] = ["1", "- Ok.", ""]
        let fala5:[String] = ["1", "- ...", ""]
        let fala6:[String] = ["2", "- ...", ""]
        let fala7:[String] = ["1", "- Bye.", ""]
        let fala8:[String] = ["2", "- Bye.", ""]
        textAndImages.append(fala1)
        textAndImages.append(fala2)
//        textAndImages.append(fala3)
//        textAndImages.append(fala4)
//        textAndImages.append(fala5)
//        textAndImages.append(fala6)
//        textAndImages.append(fala7)
//        textAndImages.append(fala8)
        ///// Teste ////////////
    
        return textAndImages
    }

    
    
    
}
