////
////  PersonagemManager.swift
////  Tempus Saga
////
////  Created by Luciano Moreira Turrini on 5/14/15.
////  Copyright (c) 2015 Luciano Moreira Turrini. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//public class PersonagemManager {
//    static let sharedInstance:PersonagemManager = PersonagemManager()
//    static let entityName:String = "Personagem"
//    lazy var managedContext:NSManagedObjectContext = {
//        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        var c = appDelegate.managedObjectContext
//        return c!
//        }()
//    
//    private init(){}
//    
//    func novoPersonagem()-> Personagem
//    {
//        return NSEntityDescription.insertNewObjectForEntityForName(PersonagemManager.entityName, inManagedObjectContext: managedContext) as! Personagem
//    }
//    
//    func salvar(){
//        var error: NSError?
//        managedContext.save(&error)
//        
//        if let e = error {
//            println("Could not save. Error: \(error), \(error!.userInfo)")
//        }
//    }
//    
//    func buscarPersonagens()->Array<Personagem>
//    {
//        let fetchRequest = NSFetchRequest(entityName: PersonagemManager.entityName)
//        var error:NSError?
//        
//        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as?
//            [NSManagedObject]
//        
//        
//        if let results = fetchedResults as? [Personagem] {
//            return results
//        } else {
//            println("Could not fetch. Error: \(error), \(error!.userInfo)")
//        }
//        
//        NSFetchRequest(entityName: "FetchRequest")
//        
//        
//        return Array<Personagem>()
//    }
//    
//    
//}
