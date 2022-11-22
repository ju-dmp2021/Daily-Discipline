//
//  TaskModel.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-22.
//

import Foundation

struct SingleTaskModel: Identifiable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func completeTask() -> SingleTaskModel {
        return SingleTaskModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

struct MultipleTaskModel: Identifiable{
    let id: String
    let title: String
    let isCompleted: Bool
    let isShown: Bool
    let subTasks: [SingleTaskModel]
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool, isShown: Bool, subTasks: [SingleTaskModel]) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.subTasks = subTasks
        self.isShown = isShown
    }
    
    func completeSubTask(task: SingleTaskModel) -> MultipleTaskModel {
        return MultipleTaskModel(id: id, title: title, isCompleted: isCompleted, isShown: isShown, subTasks: subTasks)
    }
    
    func completeTask() -> MultipleTaskModel {
        return MultipleTaskModel(id: id, title: title, isCompleted: !isCompleted, isShown: isShown, subTasks: subTasks)
    }
    
    
    func showTask() -> MultipleTaskModel{
        return MultipleTaskModel(id: id, title: title, isCompleted: isCompleted, isShown: !isShown, subTasks: subTasks)
    }
}
