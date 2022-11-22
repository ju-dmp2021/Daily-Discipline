//
//  MultipleTaskView.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-22.
//

import SwiftUI

struct MultipleTaskView: View {
    
    let multipleTaskModel: MultipleTaskModel
    
    var body: some View {
        
        VStack{
            MultipleTaskRowView(multipleTask: multipleTaskModel)
        }
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MultipleTaskView_Previews: PreviewProvider {
    static var multipleTask = MultipleTaskModel(title: "Take Pills",
                                                isCompleted: false,
                                                isShown: false,
                                                subTasks: [
                                                    SingleTaskModel(title: "magnesium", isCompleted: false),
                                                    SingleTaskModel(title: "Omega-3", isCompleted: false)
                                                    ])
    static var previews: some View {
        MultipleTaskView(multipleTaskModel: multipleTask)
    }
}
