//
//  MultipleTaskListViewModel.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-22.
//

import Foundation

class MultipleTaskListViewModel: ObservableObject{
    
    @Published var multipleTasks: [MultipleTaskModel] = []
    
    init(){
        getMultipleTasks()
    }
    
    func getMultipleTasks(){
        
        let newMultipleTask = [
            MultipleTaskModel(title: "Take Pills",
                              isCompleted: false,
                              isShown: false,
                              subTasks: [
                                SingleTaskModel(title: "Mag", isCompleted: false),
                                SingleTaskModel(title: "omega3", isCompleted: false)])]
        
        multipleTasks.append(contentsOf: newMultipleTask)
    }
    
    
    
    func updateSubTask(task: MultipleTaskModel, subTask: SingleTaskModel) {
        if let index = multipleTasks.firstIndex(where: {$0.id == task.id}){
            if let index2 = multipleTasks[index].subTasks.firstIndex(where: {$0.id == subTask.id}){
                var updatedSubTaskArray = task.subTasks
                var completedTask = SingleTaskModel(title: subTask.title, isCompleted: !subTask.isCompleted)
                
                updatedSubTaskArray.remove(at: index2)
                updatedSubTaskArray.insert(completedTask, at: index2)
                multipleTasks[index] = MultipleTaskModel(title: task.title, isCompleted: task.isCompleted, isShown: task.isShown, subTasks: updatedSubTaskArray )
            }
        }
    }
    
    func updateMultipleTask(task: SingleTaskModel){
        
        
    }
    func showSubTasks(task: MultipleTaskModel){
        if let index = multipleTasks.firstIndex(where: {$0.id == task.id}){
            multipleTasks[index] = task.showTask()
        }
    }
}

