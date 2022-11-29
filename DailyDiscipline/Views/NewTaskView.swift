//
//  NewTaskView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct NewTaskView: View {
    
    @State var textInput: String
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var singleTaskListViewModel: SingleTaskListViewModel
    @EnvironmentObject var multipleTaskListViewModel: MultipleTaskListViewModel
    @State var selectedPriority: Frequency = .weekly
    @State var showSheet: Bool = false
    
    @State var hasPressedAddSubTask: Bool = false
    @State var subTaskInput: [String] = []
    @State var tempText: String = ""
    @State var hasPressedRandomTask: Bool = false
    @StateObject var dataModel = DataModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                VStack {
               //     Navbar(leftIcon: "chevron.left", text: "Add new task!", rightIcon: "gearshape.fill")
                    
                    
                    // Testing this solution instead of code above. Starts here
                    HStack {
                        backButton
                        Spacer()
                        Text("Profile")
                            .font(.title)
                        Spacer()
                        backButton
                    }
                    .foregroundColor(.white)
                    .frame(height: 80)
                    .background(Color("NavbarBlue"))
                    // ends here
                    
                    
                    Spacer()
                    
                    VStack (alignment: .leading){
                        Text("Task")
                            .font(.title)
                        TextField(
                          "Describe your task...",
                          text: $textInput
                        )
                        .underline()
                        
                        if textInput.count != 0{
                            if hasPressedAddSubTask{
                                ForEach($subTaskInput, id:\.self) { taskInput in
                                    
                                    HStack {
                                        Text(taskInput.wrappedValue)
                                    }
                                }
                                TextField("Add Subtask...", text: $tempText)
                            }
                            
                            Button{
                                if hasPressedAddSubTask && tempText.count != 0 {
                                    subTaskInput.append(tempText)
                                    
                                }
                                    
                                else{
                                    hasPressedAddSubTask = true
                                }
                            } label: {
                                HStack{
                                    Image(systemName: "plus.circle")
                                    Text("add subtask...")
                                }
                            }
                            .onChange(of: subTaskInput) {newValue in tempText = ""}
                        }
                        
                        Button {
                            showSheet.toggle()
                        } label: {
                            Spacer()
                            Text("Get random task!") // API call
                                .padding(10)
                                .background(Color("NavbarBlue"))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .sheet(isPresented: $showSheet, content: {
                            SecondView(textInput: $textInput, hasPressedRandomTask: $hasPressedRandomTask)
                        })
                        
                        HStack {
                            Spacer()
                            Text("How frequently?")
                            Spacer()
                        }
                        PickerFrequency(selectedFrequency: $selectedPriority)
                        HStack {
                            Spacer()
                            Button {
                                if subTaskInput.isEmpty{
                                    singleTaskListViewModel.addSingleTask(title: textInput)
                                }
                                else {
                                    multipleTaskListViewModel.addMultipleTask(title: textInput, subTasks: subTaskInput)
                                }
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Add task!")
                                    .frame(width: 304)
                                    .padding(12)
                                    .background(Color("NavbarBlue"))
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                    }
                    .padding()
                    
                    Spacer()
                    WaveBottom(isAtMyTasks: false)
                }
            }
        }
        if hasPressedRandomTask {
            onAppear{
                textInput = dataModel.activity ?? "hmmmm"
            }
        }
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            NewTaskView(textInput: "")
            GeometryReader { reader in
                Color("NavbarTopBlue")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
        }
    }
}

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dataModel = DataModel()
    @Binding var textInput: String
    @Binding var hasPressedRandomTask: Bool
    var body: some View{
        ZStack(){
            Color.blue
                .edgesIgnoringSafeArea(.all)
            VStack{
                Button {
                    dataModel.getTaskFromCategory(type: "recreational")
                } label: {
                    Text("Recreational")
                }.foregroundColor(.white)
                    .padding()
                Button {
                    dataModel.getTaskFromCategory(type: "busywork")
                } label: {
                    Text("Busywork")
                }.foregroundColor(.white)
                    .padding()
                Button {
                    dataModel.getTaskFromCategory(type: "relaxation")
                } label: {
                    Text("Relaxation")
                }.foregroundColor(.white)
                    .padding()
                Button {
                    dataModel.getTaskFromCategory(type: "cooking")
                } label: {
                    Text("Cooking")
                }.foregroundColor(.white)
                    .padding()
                Button {
                    dataModel.getTaskFromCategory(type: "")
                } label: {
                    Text("Random")
                }.foregroundColor(.white)
                    .padding()
            }
        }
        .onChange(of: dataModel.activity) { newValue in
            textInput = dataModel.activity ?? ""
            presentationMode.wrappedValue.dismiss()
        }
    }
}


extension NewTaskView {
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }

    }
}
