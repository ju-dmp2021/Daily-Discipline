//
//  CoreDataManager.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-06.
//

import Foundation
import CoreData

class CoreDataManagerTaskObject: ObservableObject {
    static let shared = CoreDataManagerTaskObject()
    var moc = PersistenceController.shared.container.viewContext
    @Published var dailyTaskObjects: [TaskObject] = []
    @Published var weeklyTaskObjects: [TaskObject] = []
    @Published var monthlyTaskObjects: [TaskObject] = []
    
    func fetchDailyTaskObjects() {
        let request = NSFetchRequest<TaskObject>(entityName: "TaskObject")
        request.predicate = NSPredicate(format: "frequency == 'Daily'")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskObject.createdAt, ascending: false)]
        
        
        do {
            dailyTaskObjects = try moc.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func fetchWeeklyTaskObjects() {
        let request = NSFetchRequest<TaskObject>(entityName: "TaskObject")
        request.predicate = NSPredicate(format: "frequency == 'Weekly'")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskObject.createdAt, ascending: false)]
        
        
        do {
            weeklyTaskObjects = try moc.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func fetchMonthlyTaskObjects() {
        let request = NSFetchRequest<TaskObject>(entityName: "TaskObject")
        request.predicate = NSPredicate(format: "frequency == 'Monthly'")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \TaskObject.createdAt, ascending: false)]
        
        
        do {
            monthlyTaskObjects = try moc.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addPresetTaskObject(name: String, category: String, frequency: String) {
        let newTaskObject = TaskObject(context: moc)
        newTaskObject.name = name
        newTaskObject.points = 2
        print(frequency)
        newTaskObject.frequency = frequency
        newTaskObject.isComplete = false
        newTaskObject.category = category
        newTaskObject.createdAt = Date()
        saveData()
    }
    
    func addTaskObject(name: String, category: String, frequency: String) {
        let newTaskObject = TaskObject(context: moc)
        newTaskObject.name = name
        newTaskObject.points = 1
        print(frequency)
        newTaskObject.frequency = frequency
        newTaskObject.isComplete = false
        newTaskObject.category = category
        newTaskObject.createdAt = Date()
        saveData()
    }
    
    func deleteTaskObject(indexSet: IndexSet, frequency: String) {
        guard let index = indexSet.first else { return }
        if frequency == "Daily" {
            let entity = dailyTaskObjects[index]
            moc.delete(entity)
        } else if frequency == "Weekly" {
            let entity = weeklyTaskObjects[index]
            moc.delete(entity)
        } else if frequency == "Monthly" {
            let entity = monthlyTaskObjects[index]
            moc.delete(entity)
        }
        saveData()
    }
    
    func saveData() {
        do {
            try moc.save()
            fetchDailyTaskObjects()
            fetchWeeklyTaskObjects()
            fetchMonthlyTaskObjects()
        } catch let error {
            print("Error saving \(error)")
        }
    }
}
