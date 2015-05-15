//
//  SceneViewController.swift
//  Tempus Saga
//
//  Created by Sidney Silva on 5/14/15.
//  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var imageCharacter2: UIImageView!
    @IBOutlet weak var labelSpeak: UILabel!
    @IBOutlet weak var imageSpeakBackground: UIImageView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var buttonNext: UIButton!
    
    /// Matriz com texto e imagem opcional do tipo [String, String, String]
    // (Personagem, texto, imagem)
    var textAndImages = Array< [String?] >()
//    var textAndImages: Array< [String?] >!
    var personagem1: UIImage?
    var personagem2: UIImage?
    var background: UIImage?
    var backgroundSpeak: UIImage?
    
    private var numDialogo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Ex:
        let fala1:[String?] = ["1", "Hey man! Blá blá blá!", ""]
        textAndImages.append(fala1)
        

        imageCharacter.image = personagem1
        imageCharacter2.image = personagem2
        imageBackground.image = background
        //imageSpeakBackground.image = backgroundSpeak
        
        
        //for textImage in textAndImages {
//            let textImage = textAndImages[numDialogo]
//        
//            let personagem = textImage[0]!
//            let texto = textImage[1]
//            
//            
//            if personagem == "1" {
//                // Personagem 1 em foco, 2 transparente
//                imageCharacter2.alpha = 0.6
//            } else if personagem == "2" {
//                // Personagem 2 em foco, 1 transparente
//                imageCharacter.alpha = 0.6
//            }
//            
//            labelSpeak.text = ""
            //digitarTexto(texto, label: labelSpeak) //Pega só o texto do Array
            
        //}
        
        Animations.bubble(imageSpeakBackground)
        Animations.bubble(labelSpeak)
        
        
        Animations.slide(imageCharacter, direction: Animations.direction.toRight)
        Animations.slide(imageCharacter2, direction: Animations.direction.toLeft)
//      fireTimer()
        
        mostrarDialogo()
    }

    
    func digitarTexto (texto: String, label: UILabel) {
        
        
        
    }
    
    func mostrarDialogo(){
        
        labelSpeak.text = ""
        
        let textImage = textAndImages[numDialogo]
        
        let personagem = textImage[0]!
        let texto = textImage[1]
        
        
        if personagem == "1" {
            // Personagem 1 em foco, 2 transparente
            imageCharacter2.alpha = 0.6
        } else if personagem == "2" {
            // Personagem 2 em foco, 1 transparente
            imageCharacter.alpha = 0.6
        }
        
        //digitarTexto(texto, label: labelSpeak) //Pega só o texto do Array
        fireTimer()
    }
    
    
    //Refatorar esse método e passar para classe de animação
    private var myCounter = 0
    private var timer:NSTimer?
    
    private func fireTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "typeLetter", userInfo: nil, repeats: true)
    }
    
    //func typeLetter(texto: String, label: UILabel){
    func typeLetter(){
        let texto = textAndImages[numDialogo][1]
        let label = labelSpeak
        
        let arrayChar = Array<Character>(texto!)
        
        if myCounter < arrayChar.count {
            label.text = label.text! + String(arrayChar[myCounter])
            let randomInterval = Double ((arc4random_uniform(6)+1))/20
            timer?.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(randomInterval, target: self, selector: "typeLetter", userInfo: nil, repeats: false)
        } else {
            timer?.invalidate()
        }
        myCounter++
//        numDialogo++
    }
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




