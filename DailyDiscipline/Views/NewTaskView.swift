//
//  NewTaskView.swift
//  DailyDiscipline
//
//  Created by Ludvig Krantzén on 2022-11-18.
//

import SwiftUI

struct NewTaskView: View {
    
    @State var textInput: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var singleTaskListViewModel: SingleTaskListViewModel
    @State var selectedPriority: Frequency = .weekly
    
    @State var hasPressedAddSubTask: Bool = false
    @State var subTaskInput: [String] = [""]
    @State var tempText: String = ""
    

    
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
                                        
                                        TextField("Add subtask...", text: taskInput)
                                    }
                                }
                            }
                            Button{
                                if hasPressedAddSubTask{
                                    subTaskInput.insert(tempText, at: subTaskInput.endIndex-1)
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
                        }
                            
                        GetRandomTask()
                        HStack {
                            Spacer()
                            Text("How frequently?")
                            Spacer()
                        }
                        PickerFrequency(selectedFrequency: $selectedPriority)
                        HStack {
                            Spacer()
                            Button {
                                singleTaskListViewModel.addSingleTask(title: textInput)
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
    }
}

struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            NewTaskView()
            GeometryReader { reader in
                Color("NavbarTopBlue")
                    .frame(height: reader.safeAreaInsets.top, alignment: .top)
                    .ignoresSafeArea()
            }
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
