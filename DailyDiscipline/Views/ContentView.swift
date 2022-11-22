//
//  ContentView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct ContentView: View {
    
    //@State var tasks: [String] = ["Idag", "Har", "Vi"," Programmering"]
    @EnvironmentObject var singleTaskListViewModel: SingleTaskListViewModel
    @EnvironmentObject var multipleTaskListViewModel: MultipleTaskListViewModel

    
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
                    Navbar(leftIcon: "person.circle.fill", text: "My List", rightIcon: "gearshape.fill")
                    Spacer()
                    
                    
                    
                    List {
                        
                        //CategoryButtonView()
                        ForEach(singleTaskListViewModel.singleTasks) { task in
                            SingleTaskRowView(singleTask: task)
                                .onTapGesture { singleTaskListViewModel.updateSingleTask(task: task) }
                        }
                        ForEach(multipleTaskListViewModel.multipleTasks) { task in
                            
                            Button {
                                multipleTaskListViewModel.showSubTasks(task: task)
                            } label: {
                                VStack(alignment: .leading) {
                                    
                                    HStack {
                                        Image(systemName:("chevron.down"))
                                        Text(task.title)
                                    }
                                }
                                .foregroundColor(.black)
                            }
                            if task.isShown{
                                ForEach(task.subTasks) { task2 in
                                    SingleTaskRowView(singleTask: task2)
                                        .onTapGesture {
                                            //CODE HERE
                                            multipleTaskListViewModel.updateSubTask(task: task, subTask: task2)
                                            
                                            //CODE HERE
                                        }
                                        
                                }
                            }
                            
                            
                            
                            
                            Spacer()
                            WaveBottom(isAtMyTasks: true)
                                .background(.red) // Need to make it transparant
                        }
                    }
                    
                }
            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        @State static var multipleTask = MultipleTaskModel(title: "Take Pills",
                                                           isCompleted: false,
                                                           isShown: false,
                                                           subTasks: [
                                                            SingleTaskModel(title: "magnesium", isCompleted: false),
                                                            SingleTaskModel(title: "Omega-3", isCompleted: false)
                                                           ])
        static var previews: some View {
            
            ZStack {
                ContentView()
                
                GeometryReader { reader in
                    Color("NavbarTopBlue")
                        .frame(height: reader.safeAreaInsets.top, alignment: .top)
                        .ignoresSafeArea()
                }
            }
            
            .environmentObject(SingleTaskListViewModel())
            .environmentObject(MultipleTaskListViewModel())
            
        }
    }
}
