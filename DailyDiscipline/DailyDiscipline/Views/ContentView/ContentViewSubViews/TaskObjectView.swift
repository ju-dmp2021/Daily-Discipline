//
//  TaskObjectView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-12-07.
//

import SwiftUI

struct TaskObjectView: View {
    
    var taskObject: TaskObject
    
    @State var categoryToImage = CategoryToImage()
    @StateObject var userLevelViewModel = CoreDataManagerUserLevel()
    
    var body: some View {
        HStack {
            Button {
                taskObject.isComplete = true
                userLevelViewModel.addUserExperience(points: taskObject.points)
            } label: {
                if taskObject.isComplete == true {
                    Image(systemName: "circle.fill")
                } else {
                    Image(systemName: "circle")
                }
            }
            Text(taskObject.name ?? "No name")
            Spacer()
            Image(systemName:categoryToImage.getCategoryImage(category: taskObject.category ?? ""))
        }
    }
}
