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
    
    
    
    class func slideToRight (el: UIView){
        
        let temp:CGPoint = CGPoint(x: el.frame.origin.x, y: el.frame.origin.x)
        el.frame.origin = CGPoint(x: 0, y: el.frame.origin.y)
        
        UIView.animateWithDuration(0.7, delay: 0.1, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            el.frame.origin = temp
            
            //self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    class func bubble (el: UIView){
        let tempPos = CGPoint(x: el.frame.origin.x, y: el.frame.origin.y)
        
        el.frame.origin = CGPoint(x: el.frame.origin.x, y: el.superview!.frame.height)
        
        UIView.animateWithDuration(1, delay: 0.8, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            el.frame.origin = tempPos
            //el.layer.cornerRadius = 0
            //self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}
