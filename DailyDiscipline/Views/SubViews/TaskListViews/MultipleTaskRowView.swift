//
//  MultipleTaskView.swift
//  DailyDiscipline
//
//  Created by Harry Karl Filip Karlsson on 2022-11-22.
//

import SwiftUI

struct MultipleTaskRowView: View {
    
    @State var multipleTask: MultipleTaskModel
    
    
    var body: some View {
        
        
        VStack{
            List{
                Button {
                    
                } label: {
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Image(systemName:("chevron.down"))
                            Text(multipleTask.title)
                        }
                    }
                    .foregroundColor(.black)
                }
                if multipleTask.isShown{
                
                    ForEach(multipleTask.subTasks){ task in
                        SingleTaskRowView(singleTask: task)
                            .onTapGesture {
                                print("wtf")
                            }
                    }
                }
            }
        }
    }
}

struct MultipleTaskRowView_Previews: PreviewProvider {
    @State static var multipleTask = MultipleTaskModel(title: "Take Pills",
                                                isCompleted: false,
                                                isShown: false,
                                                subTasks: [
                                                    SingleTaskModel(title: "magnesium", isCompleted: false),
                                                    SingleTaskModel(title: "Omega-3", isCompleted: false)
                                          ])

    
    static var previews: some View {
        
        MultipleTaskRowView(multipleTask: multipleTask)
            
    }
}
