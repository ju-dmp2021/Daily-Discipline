//
//  TaskRowView.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-22.
//

import SwiftUI

struct SingleTaskRowView: View {
    
    let singleTask: SingleTaskModel
    
    var body: some View {
        HStack{
            Image(systemName: singleTask.isCompleted ? "checkmark.circle" : "circle")
            
            
            Text(singleTask.title)
            .strikethrough(singleTask.isCompleted)
            
            Spacer()
        }
        .font(.title2)
    }
}

struct TaskRowView_Previews: PreviewProvider {
    
    static var task1 = SingleTaskModel(title: "Brush teeth", isCompleted: false)
    
    static var previews: some View {
        SingleTaskRowView(singleTask: task1)
    }
        
}
