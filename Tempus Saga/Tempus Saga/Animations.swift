//
//  Animations.swift
//  Jorge Garcia
//
//  Created by Jorge Henrique P. Garcia on 4/16/15.
//  Copyright (c) 2015 Jorge Henrique P. Garcia. All rights reserved.
//

import UIKit
import AVFoundation

class Animations: NSObject {
    
    enum direction {
        case toRight
        case toLeft
    }
    
    class func slide (el: UIView, direction: Animations.direction){
        
        let temp:CGPoint = CGPoint(x: el.frame.origin.x, y: el.frame.origin.y)
        
        if direction == .toRight {
            el.frame.origin = CGPoint(x: -el.frame.size.width, y: el.frame.origin.y)
        } else if direction == .toLeft {
            el.frame.origin = CGPoint(x: el.superview!.frame.width + el.frame.size.width, y: el.frame.origin.y)
        }
        
        UIView.animateWithDuration(0.7, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            el.frame.origin = temp
            
            //self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    class func slideOut (el: UIView, direction: Animations.direction){

        var finalPos: CGPoint!
        
        if direction == .toRight {
            finalPos = CGPoint(x: el.superview!.frame.width + el.frame.size.width,
                                   y: el.frame.origin.y)
        } else if direction == .toLeft {
            finalPos = CGPoint(x: -el.frame.size.width,
                                   y: el.frame.origin.y)
        }
        
        UIView.animateWithDuration(10.0, delay: 0.3, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            el.frame.origin = finalPos
            //self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    class func bubble (el: UIView, completion: () -> () ){
        let tempPos = CGPoint(x: el.frame.origin.x, y: el.frame.origin.y)
        
        el.frame.origin = CGPoint(x: el.frame.origin.x, y: el.superview!.frame.width)
        
        UIView.animateWithDuration(1, delay: 0.8, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            el.frame.origin = tempPos
            //el.layer.cornerRadius = 0
            //self.view.layoutIfNeeded()
        }, completion: { (value: Bool) in
            completion()
        })
    }
    
    
    let queue = dispatch_queue_create("com.tempusSaga.console", DISPATCH_QUEUE_SERIAL)
    var writeText: String!
    var writing = 0
    var textBefore: String!
    
    func input(text: String, label: UILabel) {
        
        dispatch_async(self.queue, { () -> Void in
            label.text = ""
            self.writing = 0
            self.writeText = text
            self.textBefore = label.text! + "\n"
            let write = NSString(string: self.writeText)
            while self.writing <= write.length
            {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    label.text = self.textBefore + write.substringToIndex(self.writing)
                })
                
                usleep(60 * 1000)  // Milisegundos * 1000
                self.writing++
            }
        })
    }
    
    
    func mostrarDialogo(fala: Fala, img1: UIImageView, img2: UIImageView, label: UILabel, complete: () -> ()){
        // Totalmente assíncrono
        
        let personagem = fala.personagem
        let texto = fala.fala
        let imageString = fala.imagem
        var image = UIImage()
        
        dispatch_async (queue, { () -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                if let testImage = UIImage(named: imageString) {
                    image = testImage
                }
                
                if personagem == "1" {
                    // Personagem 1 em foco, 2 transparente
                    img2.alpha = 0.4
                    img1.alpha = 1
                    img1.image = image
                } else if personagem == "2" {
                    // Personagem 2 em foco, 1 transparente
                    img1.alpha = 0.4
                    img2.alpha = 1
                    img2.image = image
                }
                
                // Algo extra que quiser enfileirar
                complete ()
                
            })
        })
        self.input(texto, label: label) //Pega só o texto do Array
        
        // Pausa entre as falas
        dispatch_async (queue, { () -> Void in
            usleep(500 * 1000)  // Milisegundos * 1000
        })
        
      }

    
    func mostrarDialogoSimples(fala: Fala, img: UIImageView, label: UILabel, complete: () -> ()){
        // Totalmente assíncrono
        
        //let personagem = fala.personagem
        let texto = fala.fala
        let imageString = fala.imagem
        var image = UIImage()
        //let nDialogo = self.numDialogo
        
        /// Pega a thread criada para o texto e adiciona
        dispatch_async (queue, { () -> Void in
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
//                if let testImage = UIImage(named: imageString) {
//                    image = testImage
//                }
                
                // Algo extra que quiser enfileirar
                complete ()
            })
        })
        
        self.input(texto, label: label) //Pega só o texto do Array
        
        // Pausa entre as falas
        dispatch_async (queue, { () -> Void in
            usleep(500 * 1000)  // Milisegundos * 1000
        })
    }
    
    
    class func fadeToBlack (view: UIView) {
        
        let viewWidth = view.bounds.size.width
        let viewHeight = view.bounds.size.height
        
        let blackView = UIView(frame: CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight))
        blackView.backgroundColor = UIColor.blackColor()
        blackView.alpha = 0
        view.addSubview(blackView)
        
        UIView.animateWithDuration(2, delay: 2, options: UIViewAnimationOptions.CurveEaseOut, animations:
        {
            blackView.alpha = 1
        
        }, completion: { (value: Bool) in
            
        })
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
