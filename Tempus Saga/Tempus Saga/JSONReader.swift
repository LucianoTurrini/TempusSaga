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
    
    class func getJsonDic(fileToRead: String) -> NSDictionary{
        
        return getJSONData(fileToRead) as! NSDictionary
        
        //        let s = jsonObj.objectForKey("teste") as! String
        //        println("Leitura: \(s) ")
    }
    
    class func getFalasHistoria (era: String, numHistoria: String) -> Array<[String]> {
    
        var textAndImages = Array<[String]>()
        
//        let jsonDic: NSDictionary = getJsonDic("teste")
        let jsonDic: NSDictionary = getJsonDic("historia")
        
        
        // Terminar de implementar aqui
        
        
        return textAndImages
    }
    
    class func getFalasJogo(era: String) -> Era{
        
        
        
        
        return Era()
    }
    
    
    
    
    class func getFalas (arquivo: String) -> Array<[String]> {
        
        var textAndImages = Array<[String]>()
        
        ///// Teste ////////////
        let fala1:[String] = ["1", "- Hey man! What's up?", "char1"]
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
