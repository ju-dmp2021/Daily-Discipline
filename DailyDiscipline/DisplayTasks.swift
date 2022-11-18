//
//  DisplayTasks.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct DisplayTasks: View {
    
    var todayIsClicked: Bool
    var weeklyIsClicked: Bool
    var monthlyIsClicked: Bool
    var tasks: [String]
    
    var body: some View {
        
        
        
        if todayIsClicked == true {
                ForEach(tasks, id: \.self) { task in
                    HStack {
                        Image(systemName: "circle")
                        Text(task)
                    }
                    .padding(.top)
                }
        }
        else if weeklyIsClicked == true {
                ForEach(tasks, id: \.self) { task in
                    HStack {
                        Image(systemName: "circle")
                        Text(task)
                    }
                    .padding(.top)
                }
        }
        else if monthlyIsClicked == true {
                ForEach(tasks, id: \.self) { task in
                    HStack {
                        Image(systemName: "circle")
                        Text(task)
                    }
                    .padding(.top)
                }
        }
    }
}

struct DisplayTasks_Previews: PreviewProvider {
    @State static var tasks = ["Idag", "Har", "Vi"," Programmering"]
    static var previews: some View {
        DisplayTasks(todayIsClicked: true, weeklyIsClicked: true, monthlyIsClicked: true, tasks: tasks)
    }
}
