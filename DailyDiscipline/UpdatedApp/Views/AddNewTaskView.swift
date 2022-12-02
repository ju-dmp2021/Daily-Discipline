//
//  AddNewTaskView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-30.
//

import SwiftUI

struct AddNewTaskView: View {
    
 //   @State var presetTasks = StoredTasks()
    @State var mainTask: String = ""
    @State var selectedTask: String = "Go to the gym"
    @State var selectedPriority: FrequencyPicker = .daily
    @StateObject var vm = CoreDataRelationshipViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    @State var hasPressedRandomTask: Bool = false
    @StateObject var dataModel = DataModel()
    @State var hasPressedAddSubTask: Bool = false
    @State var showSheet: Bool = false
    
    @State var currentTask: Tasks = Tasks(name: "Buy Groceries", category: "Shopping")
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack {
                    backButton
                        .padding()
                    Spacer()
                    Text("Add new task!")
                        .font(.title)
                    Spacer()
                    settingButton
                        .padding()
                }
                .foregroundColor(.white)
                .frame(height: 80)
                .background(Color("NavbarBlue"))
                
                
                Button(action: {
                    vm.addFrequency(name: "Daily")
                }, label: {
                    Text("Add Frequency")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.cornerRadius(10))
                })
                
              //  StoredTasks(selectedTask: $selectedTask)
             //   Text(selectedTask)
                
                StoredTasks(currentTask: $currentTask)
                Text(currentTask.name)
                Text(currentTask.category)
                
                TextField(
                    "Describe your task...",
                    text: $mainTask)
                PickerFrequency(selectedFrequency: $selectedPriority)
                Group{
                    Button(action: {
                        vm.addTaskObject(mainTask: mainTask, picker: selectedPriority)
                    }, label: {
                        Text("Add Task")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    })
                    Button(action: {
                        vm.addTest()
                    }, label: {
                        Text("Add SubTask")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    })
                    Button(action: {
                        vm.deleteTaskObject()
                    }, label: {
                        Text("Delete TaskObject")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    })
                    Button(action: {
                        vm.deleteSubTask()
                    }, label: {
                        Text("Delete SubTask")
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    })
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("Get random task!") // API call
                            .foregroundColor(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.cornerRadius(10))
                    }
                    .sheet(isPresented: $showSheet, content: {
                        RandomTaskPopupView(textInput: $mainTask, hasPressedRandomTask: $hasPressedRandomTask)
                    })
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct AddNewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskView()
    }
}


extension AddNewTaskView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var settingButton: some View {
        Button {
            
        } label: {
            Image(systemName: "gearshape.fill")
        }
    }
}
