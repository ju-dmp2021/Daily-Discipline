//
//  CoreDataManager.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-30.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    private init() {
        
        persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores { description, error  in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}


class CoreDataManagers {
    static let instance = CoreDataManagers()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores { (descrption, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("saved")
        } catch let error {
            print("Error saving Core Data. \(error.localizedDescription)")
        }
    }
}
