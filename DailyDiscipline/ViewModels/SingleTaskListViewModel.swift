//
//  SingleTaskListView.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-22.
//

import Foundation

class SingleTaskListViewModel: ObservableObject{
    
    @Published var singleTasks: [SingleTaskModel] = []
    
    init() {
        getSingleTasks()
    }
    
    func getSingleTasks(){
        let newSingleTasks = [
        SingleTaskModel(title: "Brush Teeth", isCompleted: false)
        ]
        singleTasks.append(contentsOf: newSingleTasks)
        
    }
    
    func addSingleTask(title: String){
        let newSingleTask = SingleTaskModel(title: title, isCompleted: false)
        singleTasks.append(newSingleTask)
    }
    
    func updateSingleTask(task: SingleTaskModel){
        if let index = singleTasks.firstIndex(where: {$0.id == task.id}){
            singleTasks[index] = task.completeTask()
        }
    }
}

