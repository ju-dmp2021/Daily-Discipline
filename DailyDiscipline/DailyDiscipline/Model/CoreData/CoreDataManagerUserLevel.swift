//
//  CoreDataManagerUserLevel.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import Foundation
import CoreData

class CoreDataManagerUserLevel: ObservableObject {
    static let shared = CoreDataManagerUserLevel()
    var moc = PersistenceController.shared.container.viewContext
    @Published var savedUserLevel: [UserLevel] = []
    
    init() {
        if savedUserLevel.count == 0 {
            addUserLevel()
        }
    }
    
    func fetchUserLevel() {
        let request = NSFetchRequest<UserLevel>(entityName: "UserLevel")
        
        do {
            savedUserLevel = try moc.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addUserLevel() {
        let newUserLevel = UserLevel(context: moc)
        newUserLevel.exp = 0
        saveData()
    }
    
    func addUserExperience(points: Int16) {
        savedUserLevel[0].exp += points
        saveData()
    }
    
    func getCalculatedLevel() -> Int16 {
        let userLevel = savedUserLevel[0].exp / 10 + 1
        return (userLevel)
    }
    
    func getUserExperience() -> Int16 {
        let userExperience = savedUserLevel[0].exp
        return userExperience
    }
    
    func saveData() {
        do {
            try moc.save()
            fetchUserLevel()
        } catch let error {
            print("Error saving \(error)")
        }
    }
    
}
