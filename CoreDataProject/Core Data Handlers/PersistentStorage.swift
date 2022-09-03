//
//  PersistentStorage.swift
//  CoreDataProject
//
//  Created by Mayur Nilwant on 03/09/2022.
//

import Foundation

import CoreData

final class PersistentStorage {
    
    
    private init () {}
    
    public static let sharedInstance = PersistentStorage()
    
    lazy var context = persistentContainer.viewContext

    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "CoreDataProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
    
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
