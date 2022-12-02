//
//  CoreDataRelationshipModel.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-30.
//

import Foundation
import CoreData

class CoreDataRelationshipViewModel: ObservableObject {
    
    let manager = CoreDataManagers.instance
    @Published var frequencies: [Frequency] = []
    @Published var taskObjects: [TaskObject] = []
    @Published var subTasks: [SubTask] = []
    @Published var level: [UserLevel] = []
    
    init() {
        getFrequencies()
      /*  if frequencies.count < 2 {
            
            let newFrequency = Frequency(context: manager.context)
            newFrequency.name = "Daily"
            
            let secondFrequency = Frequency(context: manager.context)
            secondFrequency.name = "Weekly"
            
            let thirdFrequency = Frequency(context: manager.context)
            thirdFrequency.name = "Monthly"
            save()
             
        } */
        getTaskObjects()
        getSubTasks()
        getUserLevel()
        if level.count == 0 {
            addUserLevel()
        }
    }
    
    func getFrequencies() {
        let request = NSFetchRequest<Frequency>(entityName: "Frequency")
        
        do {
            frequencies = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getTaskObjects() {
        let request = NSFetchRequest<TaskObject>(entityName: "TaskObject")
        
        do {
            taskObjects = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getSubTasks() {
        let request = NSFetchRequest<SubTask>(entityName: "SubTask")
        
        do {
            subTasks = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getUserLevel(){
        let request = NSFetchRequest<UserLevel>(entityName: "UserLevel")
        
        do {
            level = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    func getCalculatedLevel() -> Int16{
        let userLevel = level[0].exp / 10 + 1
        return (userLevel)
    }
    
    func getTaskObjects(forFrequency frequency: Frequency) {
        let request = NSFetchRequest<TaskObject>(entityName: "TaskObject")
        
        let filter = NSPredicate(format: "frequency == %@", frequency)
        request.predicate = filter
        
        do {
            taskObjects = try manager.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error.localizedDescription)")
        }
    }
    
    
    func addFrequency(name: String) {
        let newFrequency = Frequency(context: manager.context)
        newFrequency.name = "\(name)"
        save()
    }
    
    func addTaskObject() {
        let newTaskObject = TaskObject(context: manager.context)
        newTaskObject.mainTask = "Take out trash"
        newTaskObject.isComplete = false
        newTaskObject.dateCreated = Date()
        newTaskObject.category = "Shores"
        
        newTaskObject.frequency = frequencies[0]
        save()
    }
    
    func addTaskObject(mainTask: String, picker: FrequencyPicker) {
        let newTaskObject = TaskObject(context: manager.context)
        newTaskObject.mainTask = mainTask
        newTaskObject.isComplete = false
        newTaskObject.dateCreated = Date()
        newTaskObject.category = "Fitness"
        newTaskObject.points = 1
        
        if (picker == .daily) {
            newTaskObject.frequency = frequencies[0]
        } else if (picker == .weekly) {
            newTaskObject.frequency = frequencies[1]
        } else if (picker == .monthly) {
            newTaskObject.frequency = frequencies[2]
        }
        save()
    }
    
    func addSubTask() {
        let newSubTask = SubTask(context: manager.context)
        newSubTask.name = "Put on shoes"
        newSubTask.isComplete = false
        
        newSubTask.taskObject = taskObjects[0]
        newSubTask.frequency = frequencies[0]
        save()
    }
    
    func addUserLevel() {
        let newUserLevel = UserLevel(context: manager.context)
        newUserLevel.exp = 0
        
        save()
    }
    
    func updateUserLevel(points: Int16) {
        level[0].exp += points
        save()
    }
    
    func deleteTaskObject() {
        let taskObject = taskObjects[0] // Choose which taskobject is deleted.
        manager.context.delete(taskObject)
        save()
    }
    
    func deleteSubTask() {
        let subTask = subTasks[0] // Choose which taskobject is deleted.
        manager.context.delete(subTask)
        save()
    }
    
    // Below is my own tests for adding a TaskObject and SubTask at the same time.
    
    func addFirstObject() {
        //getFrequencies()
       // getSubTasks()
        let newTaskObject = TaskObject(context: manager.context)
        newTaskObject.mainTask = "Take out trash"
        newTaskObject.isComplete = false
        newTaskObject.dateCreated = Date()
        newTaskObject.category = "Shores"
        
        newTaskObject.frequency = frequencies[0]
        
     //   newTaskObject.addToSubTasks(subTasks[2])
        save()
    }
    
    func addFirstSubTask() {
        let newSubObject = SubTask(context: manager.context)
        newSubObject.name = "SideQuest"
        newSubObject.isComplete = false
        
        newSubObject.taskObject = taskObjects[0]
        newSubObject.frequency = frequencies[0]
        save()
    }
    
    func addTest() {
        let newSubObject = SubTask(context: manager.context)
        newSubObject.name = "SideQuest"
        newSubObject.isComplete = false
        newSubObject.frequency = frequencies[0]
        
        save()
        getFrequencies()
        getTaskObjects()
        getSubTasks()
        let newTaskObject = TaskObject(context: manager.context)
        newTaskObject.mainTask = "Take out trash"
        newTaskObject.isComplete = false
        newTaskObject.dateCreated = Date()
        newTaskObject.category = "Shores"
        
        newTaskObject.frequency = frequencies[0]
        
        newTaskObject.addToSubTasks(subTasks[0])
        save()
    }

    // 7,4
    func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = taskObjects[index]
            manager.context.delete(task)
            save()
        }
    }
    
    func save() {
        frequencies.removeAll()   // Funkar om man kommenterar ut dessa, typ
        taskObjects.removeAll()
        subTasks.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now()) { // + 1.0
            self.manager.save()
            self.getFrequencies()
            self.getTaskObjects()
            self.getSubTasks()
        }
    }
}
